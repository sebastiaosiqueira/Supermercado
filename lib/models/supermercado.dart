

class Supermercado {
  late int id;
  late String nome;

  Supermercado({required this.id, required this.nome});

  Supermercado.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['nome'] = nome;
    return data;
  }
}
