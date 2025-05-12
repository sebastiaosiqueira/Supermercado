import 'package:flutter/material.dart';
import 'package:mercado/ui/android/pages/Produto/produto.page.cadastro.dart';
import 'package:mercado/widgtes/widget.tabview.produtos.dart';

class ProdutoLista extends StatelessWidget {
  const ProdutoLista({super.key});
  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Lista de Produtos';

    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Expanded(child: Center(child: TabProduto())),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                     
                IconButton(
              tooltip: "Produtos",
                  iconSize: 60,
                  icon: const Icon(Icons.add_circle),
                   color: Colors.blue,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProdutoCadastroPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
