import '../Database/databasehelper.dart';
import '../models/supermercado.dart';

class MercadoRepository {
  final dbHelper = DatabaseHelper();
  final String tableName = 'mercados';

  Future<int> insertMercado(Mercado mercado) async {
    return await dbHelper.insert(tableName, mercado.toMap());
  }

  Future<List<Mercado>> getAllMercados() async {
    final List<Map<String, dynamic>> maps = await dbHelper.queryAll(tableName);
    return List.generate(maps.length, (i) {
      return Mercado.fromMap(maps[i]);
    });
  }

  Future<Mercado?> getMercado(int id) async {
    final List<Map<String, dynamic>> result = await dbHelper.queryById(tableName, id);
    if (result.isNotEmpty) {
      return Mercado.fromMap(result.first);
    }
    return null;
  }

  Future<int> updateMercado(Mercado mercado) async {
    return await dbHelper.update(tableName, mercado.toMap(), mercado.id!);
  }

  Future<int> deleteMercado(int id) async {
    return await dbHelper.delete(tableName, id);
  }
}