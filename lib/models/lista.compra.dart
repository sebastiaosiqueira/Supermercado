import 'dart:nativewrappers/_internal/vm/lib/ffi_native_type_patch.dart';

import 'package:mercado/models/compra.dart';
import 'package:mercado/models/produto.dart';

class ListaCompra {
  late int id;
  late Compra idcompra;
  late Produto idproduto;
  late int quantidade;
  late Double valor;
  late Double valortotal;

  ListaCompra({
    required this.id,
    required this.idcompra,
    required this.idproduto,
    required this.quantidade,
    required this.valor,
    required this.valortotal,
  });

 
}
