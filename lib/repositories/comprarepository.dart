import 'package:mercado/models/compra.dart';
import 'package:sqflite/sqflite.dart';

class Comprarepository {
  late Database _db;

  Future<List<Compra>> getAll() async {
    var res = await _db.query("compra");
    List<Compra> list =
        res.isNotEmpty ? res.map((c) => Compra.fromJson(c)).toList() : [];
    return list;
  }

  newCompra(Compra newCompra) async {
    var res = await _db.insert("produto", newCompra.toJson());
    return res;
  }

  getCompra(int id) async {
    var res = await _db.query("Compra", where: "id=?", whereArgs: [id]);
    return res.isNotEmpty ? Compra.fromJson(res.first) : Null;
  }

  updateCompra(Compra compra) async {
    var res = await _db.update(
      "Compra",
      compra.toJson(),
      where: "id= ?",
      whereArgs: [compra.id],
    );
    return res;
  }

  deleteCompra(int id) async {
    _db.delete("Compra", where: "id=?", whereArgs: [id]);
  }
}
