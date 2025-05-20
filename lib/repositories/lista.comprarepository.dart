import '../Database/databasehelper.dart';
import '../models/lista.compra.dart';

class ListaCompraRepository {
  final dbHelper = DatabaseHelper();
  final String tableName = 'lista_compras';

  Future<int> insertListaCompra(ListaCompra listaCompra) async {
    return await dbHelper.insert(tableName, listaCompra.toMap());
  }

  Future<List<ListaCompra>> getAllListaCompras() async {
    final List<Map<String, dynamic>> maps = await dbHelper.queryAll(tableName);
    return List.generate(maps.length, (i) {
      return ListaCompra.fromMap(maps[i]);
    });
  }

  Future<ListaCompra?> getListaCompra(int id) async {
    final List<Map<String, dynamic>> result = await dbHelper.queryById(tableName, id);
    if (result.isNotEmpty) {
      return ListaCompra.fromMap(result.first);
    }
    return null;
  }

  Future<int> updateListaCompra(ListaCompra listaCompra) async {
    return await dbHelper.update(tableName, listaCompra.toMap(), listaCompra.id!);
  }

  Future<int> deleteListaCompra(int id) async {
    return await dbHelper.delete(tableName, id);
  }
}