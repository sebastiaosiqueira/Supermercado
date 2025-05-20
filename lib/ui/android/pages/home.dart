
import 'package:flutter/material.dart';
import 'package:mercado/ui/android/pages/Produto/ProdutoListScreen';

import 'Produto/ProdutoListScreen';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Primeira Rota'),
      ),
      body: Center(
        child: TextButton(
          child: Text('Abrir rota(tela)'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProdutoListScreen()),
            );
          },
        ),
      ),
    );
  }
}