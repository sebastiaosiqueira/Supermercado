import 'package:mercado/enums/tipoprodutoenum.dart';

class Produto {
  late String id;
  late String descricao;
  late TipoProduto tipoproduto;

  Produto({
    required this.id,
    required this.descricao,
    required this.tipoproduto,
  });

  Produto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descricao = json['descricao'];
    tipoproduto = json['tipoproduto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['descricao'] = descricao;
    data['tipoproduto'] = tipoproduto;
    return data;
  }
}
