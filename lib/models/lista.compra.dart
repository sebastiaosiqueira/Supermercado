class ListaCompra {
  int? id;
  int idProduto;
  int quantidade;
  double valor;
  double total;

  ListaCompra({
    this.id,
    required this.idProduto,
    required this.quantidade,
    required this.valor,
    required this.total,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idproduto': idProduto,
      'quantidade': quantidade,
      'valor': valor,
      'total': total,
    };
  }

  factory ListaCompra.fromMap(Map<String, dynamic> map) {
    return ListaCompra(
      id: map['id'],
      idProduto: map['idproduto'],
      quantidade: map['quantidade'],
      valor: (map['valor'] as num).toDouble(),
      total: (map['total'] as num).toDouble(),
    );
  }
}