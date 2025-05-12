import 'package:flutter/material.dart';
import 'package:mercado/blocs/HomeBloc.dart';
import 'package:mercado/enums/title.widget.dart';
import 'package:mercado/models/produto.dart';
import 'package:provider/provider.dart';

class TabProduto extends StatelessWidget {
  const TabProduto({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final HomeBloc bloc = Provider.of<HomeBloc>(context);
    if (bloc.produtos?.length == null) {
     
      return Text("Não há produtos cadastrados");
    }
    return ListView.builder(
      itemCount: bloc.produtos?.length,
      itemBuilder: (BuildContext context, index) {
        return ListTile(
          title: Text(bloc.produtos.toString()),
          leading: Text(bloc.produtos.toString()),
        );
      },
    );
  }
}
