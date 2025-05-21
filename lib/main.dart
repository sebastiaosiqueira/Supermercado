import 'package:flutter/material.dart';
import 'package:mercado/ui/android/pages/home.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart'; // Para kIsWeb

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Navegação Básica',
    theme: ThemeData(primarySwatch: Colors.blue),
    home: Home(),
  ));
}
