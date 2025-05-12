import 'package:mercado/models/produto.dart';
import 'package:sqflite/sqflite.dart';

class Produtorepository {
  late final Database? _db;


   Future<List<Produto>> getAll() async {
    Database? db = _db;
    final List<Map<String, Object?>>? maps = await db?.query('produto');

    return List.generate(maps!.length, (i) {
      return Produto.fromMap(maps[i]);
    });
  }

   Future<int?> newProduto(Produto produto) async {
    Database? db = await _db;
    try {
      // Se o ID for 0 ou null, o SQLite o tratará como autoincremento.
      // O método `insert` retorna o ID da linha recém-inserida.
      return await db?.insert('produto', produto.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (e) {
      print('Erro ao inserir produto: $e');
      rethrow; // Relança a exceção para ser tratada na UI, se necessário.
    }
  }




    // Atualiza um Produto existente no banco de dados.
  Future<int?> updateProduto(Produto produto) async {
    Database? db = await _db;
    return await db?.update(
      'produtos',
      produto.toMap(),
      where: 'id = ?',
      whereArgs: [produto.id],
    );
  }

 // Deleta um Produto do banco de dados pelo ID.
  Future<int?> deleteProduto(int id) async {
    Database? db = await _db;
    return await db?.delete(
      'produtos',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

    Future close() async {
    Database? db = await _db;
    db?.close();
    var __db = null;
    _db = __db;
  }
}
