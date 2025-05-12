import 'package:mercado/enums/tipoprodutoenum.dart';

// Arquivo: lib/models/produto.dar

// Define a classe Produto para representar os dados do produto.
class Produto {
  late int? id; // O ID será nulo se o produto ainda não foi salvo no banco.
  late String? descricao;
  late TipoProduto? tipoproduto;

  Produto({
    this.id = 0, // Valor padrão conforme solicitado
    this.descricao,
    this.tipoproduto,
  });

  // Converte um objeto Produto em um Map.
  // As chaves do Map devem corresponder aos nomes das colunas no banco de dados.
  Map<String, dynamic> toMap() {
    return {
      'id': id == 0 ? null : id, // Envia null para o banco para autoincremento se id for 0
      'descricao': descricao,
      'tipo_produto': tipoproduto?.name, // Armazena o nome da enum como string
    };
  }

  // Construtor factory para criar uma instância de Produto a partir de um Map.
  // Útil ao ler dados do banco de dados.
  factory Produto.fromMap(Map<String, dynamic> map) {
    return Produto(
      id: map['id'] as int?,
      descricao: map['descricao'] as String?,
      tipoproduto: map['tipo_produto'] != null
          ? TipoProduto.fromString(map['tipo_produto'] as String)
          : null,
    );
  }

  // Sobrescreve o método toString para facilitar a depuração.
  @override
  String toString() {
    return 'Produto{id: $id, descricao: $descricao, tipoproduto: ${tipoproduto?.nomeAmigavel}}';
  }
}
