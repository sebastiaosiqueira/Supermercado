import '../enums/tipoprodutoenum.dart';

class Produto {
  int? id;
  String descricao;
  TipoProdutoEnum tipo;

  Produto({this.id, required this.descricao, required this.tipo});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'descricao': descricao,
      'tipo': tipo.name,
    };
  }

  factory Produto.fromMap(Map<String, dynamic> map) {
    return Produto(
      id: map['id'],
      descricao: map['descricao'],
      tipo: TipoProdutoEnum.values.byName(map['tipo']),
    );
  }
}