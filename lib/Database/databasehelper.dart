import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DatabaseHelper {
  static Database? _database;
  static final DatabaseHelper instance = DatabaseHelper._internal();

  factory DatabaseHelper() => instance;

  DatabaseHelper._internal() {
    // Inicializa o FFI se não estiver na web
    if (!kIsWeb) {
      sqfliteFfiInit();
    }
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<String> get fullPath async {
    const name = 'lista_compras.db';
    final path = await getDatabasesPath();
    return join(path, name);
  }

  Future<Database> _initDatabase() async {
    final path = await fullPath;
    // No desktop/web, a databaseFactory precisa ser a FFI factory
    DatabaseFactory dbFactory = kIsWeb ? databaseFactory : databaseFactoryFfi;
    return await dbFactory.openDatabase(
      path,
      options: OpenDatabaseOptions(
        version: 1,
        onCreate: _onCreate,
      ),
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE produtos (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        descricao TEXT NOT NULL,
        tipo TEXT NOT NULL
      )
    ''');
    await db.execute('''
      CREATE TABLE mercados (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT NOT NULL
      )
    ''');
    await db.execute('''
      CREATE TABLE compras (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        data TEXT NOT NULL,
        idmercado INTEGER NOT NULL,
        FOREIGN KEY (idmercado) REFERENCES mercados(id)
      )
    ''');
    await db.execute('''
      CREATE TABLE lista_compras (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        idproduto INTEGER NOT NULL,
        quantidade INTEGER NOT NULL,
        valor REAL NOT NULL,
        total REAL NOT NULL,
        FOREIGN KEY (idproduto) REFERENCES produtos(id)
      )
    ''');
  }

  // Métodos genéricos para operações CRUD

  Future<int> insert(String table, Map<String, dynamic> data) async {
    final db = await instance.database;
    return await db.insert(table, data);
  }

  Future<List<Map<String, dynamic>>> queryAll(String table) async {
    final db = await instance.database;
    return await db.query(table);
  }

  Future<List<Map<String, dynamic>>> queryById(String table, int id) async {
    final db = await instance.database;
    return await db.query(table, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(String table, Map<String, dynamic> data, int id) async {
    final db = await instance.database;
    return await db.update(table, data, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> delete(String table, int id) async {
    final db = await instance.database;
    return await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }
}