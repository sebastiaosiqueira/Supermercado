class Mercado {
  int? id;
  String nome;

  Mercado({this.id, required this.nome});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
    };
  }

  factory Mercado.fromMap(Map<String, dynamic> map) {
    return Mercado(
      id: map['id'],
      nome: map['nome'],
    );
  }
}