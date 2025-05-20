import 'package:flutter/material.dart';
import 'package:mercado/enums/tipoprodutoenum.dart';
import '../../../../models/produto.dart';
import '../../../../repositories/produtorepository.dart';

class ProdutoCreateUpdateScreen extends StatefulWidget {
  final Produto? produto;

  ProdutoCreateUpdateScreen({this.produto});

  @override
  _ProdutoCreateUpdateScreenState createState() =>
      _ProdutoCreateUpdateScreenState();
}

class _ProdutoCreateUpdateScreenState extends State<ProdutoCreateUpdateScreen> {
  final _formKey = GlobalKey<FormState>();
  final _descricaoController = TextEditingController();
  TipoProdutoEnum? _tipoSelecionado;
  final ProdutoRepository _produtoRepository = ProdutoRepository();

  @override
  void initState() {
    super.initState();
    if (widget.produto != null) {
      _descricaoController.text = widget.produto!.descricao;
      _tipoSelecionado = widget.produto!.tipo;
    }
  }

  Future<void> _salvarProduto() async {
    if (_formKey.currentState!.validate() && _tipoSelecionado != null) {}
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
