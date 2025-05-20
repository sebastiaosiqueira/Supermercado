import '../Database/databasehelper.dart';
import '../models/compra.dart';


class CompraRepository {
  final dbHelper = DatabaseHelper();
  final String tableName = 'compras';

  Future<int> insertCompra(Compra compra) async {
    return await dbHelper.insert(tableName, compra.toMap());
  }

  Future<List<Compra>> getAllCompras() async {
    final List<Map<String, dynamic>> maps = await dbHelper.queryAll(tableName);
    return List.generate(maps.length, (i) {
      return Compra.fromMap(maps[i]);
    });
  }

  Future<Compra?> getCompra(int id) async {
    final List<Map<String, dynamic>> result = await dbHelper.queryById(tableName, id);
    if (result.isNotEmpty) {
      return Compra.fromMap(result.first);
    }
    return null;
  }

  Future<int> updateCompra(Compra compra) async {
    return await dbHelper.update(tableName, compra.toMap(), compra.id!);
  }

  Future<int> deleteCompra(int id) async {
    return await dbHelper.delete(tableName, id);
  }
}