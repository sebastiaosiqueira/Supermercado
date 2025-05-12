import 'package:flutter/rendering.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path/path.dart' show join;

class DatabaseHelper {

static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _db;
  bool _databaseInitialized =
      false;
 Future<Database> get database async {
    if (_databaseInitialized) {
      return _db!;
    }
    _db = await _initDatabase();
    _databaseInitialized =
        true; // Atualize a variável de estado após a inicialização
    return _db!;
  }

    Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'Compra.db');
    return await openDatabase(
      path,
      version: 1, // Versão do schema do banco de dados.
      onCreate: _onCreate, // Método chamado ao criar o banco pela primeira vez.
    );
  }
  }


  Future<Database> _onCreate(Database db, int version) async {
  await db.execute('''
      CREATE TABLE produto (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        descricao TEXT,
        tipo_produto TEXT
      )
    ''');

     await db.execute('''
      CREATE TABLE supermercado (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT,
      )
    ''');
     await db.execute('''
      CREATE TABLE compra (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        supermercadoid integer
        datacompra DATETIME,
       foreign key(supemercadoid) references supermercado(id))
      )
    ''');
         await db.execute('''
      CREATE TABLE listacompra (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        idcompra INTEGER,
        idproduto INTEGER,
        quantidade INTEGER,
        valor DECIMAL(10,2),
        valortotal DECIMAL(10,2),
        foreign key (idcompra) references compra(id), foreign key(idproduto) references produto)

      )
    ''');

    return db;
  }


