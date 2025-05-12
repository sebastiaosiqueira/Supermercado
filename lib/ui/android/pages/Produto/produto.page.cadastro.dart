import 'package:flutter/material.dart';
import 'package:mercado/enums/tipoprodutoenum.dart';
import 'package:mercado/models/produto.dart';
import 'package:mercado/repositories/produtorepository.dart';


class ProdutoCadastroPage extends StatefulWidget {
  // Opcional: Receber um produto para edição.
  // final Produto? produtoParaEdicao;
  // const ProdutoCadastroPage({super.key, this.produtoParaEdicao});
  const ProdutoCadastroPage({super.key});

  @override
  State<ProdutoCadastroPage> createState() => _ProdutoCadastroPageState();
}

class _ProdutoCadastroPageState extends State<ProdutoCadastroPage> {
  
  final _formKey = GlobalKey<FormState>();
  final _descricaoController = TextEditingController();
  TipoProduto? _tipoProdutoSelecionado;

  final Produtorepository _dbHelper = Produtorepository();
  late Produto _produtoAtual;

  @override
  void initState() {
    super.initState();
    // Inicializa _produtoAtual. Se fosse para edição, você carregaria os dados aqui.
    // if (widget.produtoParaEdicao != null) {
    //   _produtoAtual = widget.produtoParaEdicao!;
    //   _descricaoController.text = _produtoAtual.descricao ?? '';
    //   _tipoProdutoSelecionado = _produtoAtual.tipoproduto;
    // } else {
    //   _produtoAtual = Produto(); // Cria um novo produto com id = 0 (ou null via toMap)
    // }
     _produtoAtual = Produto(); // Cria um novo produto com id = 0 (ou null via toMap)
  }

  @override
  void dispose() {
    _descricaoController.dispose();
    super.dispose();
  }

  void _limparCampos() {
    _descricaoController.clear();
    setState(() {
      _tipoProdutoSelecionado = null;
      _produtoAtual = Produto(); // Reseta para um novo produto
    });
    _formKey.currentState?.reset();
  }

  Future<void> _salvarProduto() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save(); // Chama os onSaved dos campos

      // Atualiza o objeto _produtoAtual com os valores do formulário
      _produtoAtual.descricao = _descricaoController.text.trim();
      _produtoAtual.tipoproduto = _tipoProdutoSelecionado;
      // O ID já está em _produtoAtual (0 para novo, ou o ID existente para edição)

      try {
        int? idSalvo;
        // if (_produtoAtual.id != null && _produtoAtual.id != 0) {
        //   // Lógica para atualizar um produto existente (não implementado neste exemplo básico)
        //   // idSalvo = await _dbHelper.updateProduto(_produtoAtual);
        //   // print('Produto atualizado com ID: $idSalvo');
        // } else {
        //   // Insere novo produto
        // }
        idSalvo = await _dbHelper.newProduto(_produtoAtual);
        
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Produto salvo com sucesso! ID: $idSalvo')),
          );
          _limparCampos();
          _carregarProdutos(); // Para depuração
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Erro ao salvar produto: ${e.toString()}')),
          );
        }
        print('Erro detalhado ao salvar produto: $e');
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, corrija os erros no formulário.')),
      );
    }
  }

  Future<void> _carregarProdutos() async {
    try {
      List<Produto> produtos = await _dbHelper.getAll();
      print("--- Produtos Cadastrados ---");
      if (produtos.isEmpty) {
        print("Nenhum produto cadastrado.");
      } else {
        for (var p in produtos) {
          print(p);
        }
      }
      print("---------------------------");
    } catch (e) {
      print("Erro ao carregar produtos: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_produtoAtual.id != null && _produtoAtual.id != 0 && _produtoAtual.id != null
            ? 'Editar Produto'
            : 'Cadastrar Novo Produto'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              // Campo de texto para a descrição do produto.
              TextFormField(
                controller: _descricaoController,
                decoration: const InputDecoration(
                  labelText: 'Descrição do Produto',
                  hintText: 'Ex: Camiseta Branca Algodão',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.description_outlined),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Por favor, insira a descrição do produto.';
                  }
                  if (value.trim().length < 3) {
                    return 'A descrição deve ter pelo menos 3 caracteres.';
                  }
                  return null;
                },
                // onSaved: (value) => _produtoAtual.descricao = value?.trim(),
              ),
              const SizedBox(height: 16.0),

              // Dropdown para selecionar o tipo de produto.
              DropdownButtonFormField<TipoProduto>(
                value: _tipoProdutoSelecionado,
                decoration: const InputDecoration(
                  labelText: 'Tipo do Produto',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.category_outlined),
                ),
                hint: const Text('Selecione o tipo'),
                isExpanded: true,
                items: TipoProduto.values.map((TipoProduto tipo) {
                  return DropdownMenuItem<TipoProduto>(
                    value: tipo,
                    child: Text(tipo.nomeAmigavel), // Usa o nome amigável
                  );
                }).toList(),
                onChanged: (TipoProduto? novoValor) {
                  setState(() {
                    _tipoProdutoSelecionado = novoValor;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Por favor, selecione o tipo do produto.';
                  }
                  return null;
                },
                // onSaved: (value) => _produtoAtual.tipoproduto = value,
              ),
              const SizedBox(height: 32.0),

              ElevatedButton.icon(
                icon: const Icon(Icons.save_alt_outlined),
                label: const Text('Salvar Produto'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                ),
                onPressed: _salvarProduto,
              ),
              const SizedBox(height: 12.0),
              TextButton.icon(
                icon: const Icon(Icons.list_alt_outlined),
                label: const Text('Listar Produtos (Console)'),
                onPressed: _carregarProdutos,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
