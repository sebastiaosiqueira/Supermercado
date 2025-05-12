import 'package:flutter/material.dart';
import 'package:mercado/blocs/HomeBloc.dart';
import 'package:mercado/enums/title.widget.dart';
import 'package:provider/provider.dart';

class TabCompra extends StatelessWidget {
  const TabCompra({super.key});

  @override
  Widget build(BuildContext context){
 final HomeBloc bloc = Provider.of<HomeBloc>(context);
    if (bloc.produtos?.length == null) {
     
      return Text("Não há produtos cadastrados");
    }
    return Center(
      child: 
                   ListView.builder(
              itemCount: 25,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text('${titles[0]} $index'),
                );
              },
            ),
          
            );
  }
}
