import 'package:flutter/material.dart';
import 'package:mercado/models/compra.dart';
import 'package:mercado/models/produto.dart';
import 'package:mercado/repositories/comprarepository.dart';
import 'package:mercado/repositories/produtorepository.dart';

class HomeBloc extends ChangeNotifier {
  final produtoRepository = new Produtorepository();
  final comprarepository = new Comprarepository();

  List<Produto>? produtos;
  List<Compra>? compras;
  Produto? produto;

  HomeBloc() {
    var produtos = getProdutos();
    var compras = getCompras();
  }

  getProdutos() {
    produtoRepository.getAll().then((data) {
      produtos = data;
      notifyListeners();
    });
  }

  getCompras() {
    comprarepository.getAll().then((data) {
      compras = data;
      notifyListeners();
    });
  }
}
