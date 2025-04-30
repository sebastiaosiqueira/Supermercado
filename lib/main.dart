import 'package:flutter/material.dart';
import 'package:mercado/ui/android/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Compras no mercado',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 57, 141, 236)),
      ),
      home: const Home(),
    );
  }
}

