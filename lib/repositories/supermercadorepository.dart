 import 'package:mercado/models/supermercado.dart';
import 'package:sqflite/sqflite.dart';

class Supermercadorepository {
 late Database _db;
 Future<List<Supermercado>> getAll() async {
    var res = await _db.query("supermercado");
    List<Supermercado> list =
        res.isNotEmpty ? res.map((c) => Supermercado.fromJson(c)).toList() : [];
    return list;
  }

  newProduto(Supermercado newSupermercado) async {
    var res = await _db.insert("produto", newSupermercado.toJson());
    return res;
  }

  getProduto(int id) async {
    var res = await _db.query("Supermercado", where: "id=?", whereArgs: [id]);
    return res.isNotEmpty ? Supermercado.fromJson(res.first) : Null;
  }

  updateProduto(Supermercado supermercado) async {
    var res = await _db.update(
      "Supermercado",
      supermercado.toJson(),
      where: "id= ?",
      whereArgs: [supermercado.id],
    );
    return res;
  }

  deleteProduto(int id) async {
    _db.delete("Supermercado", where: "id=?", whereArgs: [id]);
  }
}
