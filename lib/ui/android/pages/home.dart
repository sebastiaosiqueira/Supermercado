import 'package:flutter/material.dart';
import 'package:mercado/ui/android/pages/Produto/produto.page.list.dart';
import 'package:mercado/widgtes/widget.tabview.produtos.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Compras Supermercado';

    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Expanded(child: Center(child: TabProduto())),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  tooltip: "Compras",
                  iconSize: 60,
                  icon: const Icon(Icons.paid),
                   color: Colors.green,
                  onPressed: () {},
                ),
                IconButton(
                  tooltip: "Supermercados",
                  iconSize: 60,
                  icon: const Icon(Icons.store),
                  color: Colors.blue,
                  onPressed: () {},
                ),
                IconButton(
  
              tooltip: "Produtos",
                  iconSize: 60,
                    color: Colors.accents.first,
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProdutoLista(),
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
