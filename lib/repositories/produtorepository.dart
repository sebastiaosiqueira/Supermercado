import '../Database/databasehelper.dart';
import '../models/produto.dart';

class ProdutoRepository {
  final dbHelper = DatabaseHelper();
  final String tableName = 'produtos';

  Future<int> insertProduto(Produto produto) async {
    return await dbHelper.insert(tableName, produto.toMap());
  }

  Future<List<Produto>> getAllProdutos() async {
    final List<Map<String, dynamic>> maps = await dbHelper.queryAll(tableName);
    return List.generate(maps.length, (i) {
      return Produto.fromMap(maps[i]);
    });
  }

  Future<Produto?> getProduto(int id) async {
    final List<Map<String, dynamic>> result = await dbHelper.queryById(tableName, id);
    if (result.isNotEmpty) {
      return Produto.fromMap(result.first);
    }
    return null;
  }

  Future<int> updateProduto(Produto produto) async {
    return await dbHelper.update(tableName, produto.toMap(), produto.id!);
  }

  Future<int> deleteProduto(int id) async {
    return await dbHelper.delete(tableName, id);
  }
}