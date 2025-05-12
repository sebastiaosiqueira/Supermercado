import 'package:mercado/models/supermercado.dart';

class Compra {
  late int id;
  late Supermercado supermercado;
  late DateTime datacompra;

  Compra({required this.id, required this.supermercado, required datacompra});

  Compra.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    supermercado = json['supermercado'];

    supermercado =
        (json['supermercado'] != null
            ? new Supermercado.fromJson(json['supermercado'])
            : null)!;
    datacompra = json['datacompra'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    if (this.supermercado != null) {
      data['supermercado'] = this.supermercado.toJson();
    }
    data['datacompra'] = datacompra;
    return data;
  }
}
