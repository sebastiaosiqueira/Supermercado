
class Compra {
  int? id;
  DateTime data;
  int idMercado;

  Compra({this.id, required this.data, required this.idMercado});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'data': data.toIso8601String(),
      'idmercado': idMercado,
    };
  }

  factory Compra.fromMap(Map<String, dynamic> map) {
    return Compra(
      id: map['id'],
      data: DateTime.parse(map['data']),
      idMercado: map['idmercado'],
    );
  }
}