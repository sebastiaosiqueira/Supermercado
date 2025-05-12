import 'package:mercado/models/lista.compra.dart';
import 'package:sqflite/sqflite.dart';

class ListaCompraRepository {
  late Database _db;
   Future<List<ListaCompra>> getAll() async {
    var res = await _db.query("ListaCompra");
    List<ListaCompra> list =
        res.isNotEmpty ? res.map((c) => ListaCompra.fromJson(c)).toList() : [];
    return list;
  }

  newListaCompra(ListaCompra newListaCompra) async {
    var res = await _db.insert("ListaCompra", newListaCompra.toJson());
    return res;
  }

  getListaCompra(int id) async {
    var res = await _db.query("ListaCompra", where: "id=?", whereArgs: [id]);
    return res.isNotEmpty ? ListaCompra.fromJson(res.first) : Null;
  }

  updateListaCompra(ListaCompra produto) async {
    var res = await _db.update(
      "ListaCompra",
      produto.toJson(),
      where: "id= ?",
      whereArgs: [produto.id],
    );
    return res;
  }

  deleteItemListacompra(int id) async {
    _db.delete("ListaCompra", where: "id=?", whereArgs: [id]);
  }
}
