import 'package:flutter/material.dart';
import 'package:mercado/blocs/HomeBloc.dart';
import 'package:mercado/repositories/databasehelper.dart';
import 'package:mercado/ui/android/pages/home.dart';
import 'package:provider/provider.dart';


void main() async {
  
  // Inicialize o banco de dados
  final _db = DatabaseHelper();
  await _db.database; // Aguarde a inicialização

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:
       [ChangeNotifierProvider<HomeBloc>.value(
        value: HomeBloc(),
        ),
        ],
      child: Main(),
    );
  }
}

class Main extends StatelessWidget {
  const Main({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      padding: EdgeInsets.all(10),
      child: MaterialApp(
        title: 'Compras no mercado',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 57, 141, 236),
          ),
        ),

        home: const Home(),

        
      ),
    );
  }
}
