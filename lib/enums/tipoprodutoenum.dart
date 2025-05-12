enum TipoProduto {
  alimentos,
  frios,
  higiene,
  limpeza,
  outros;

  String get nomeAmigavel {
    switch (this) {
      case TipoProduto.alimentos:
        return 'Alimentos';
      case TipoProduto.frios:
        return 'Frios';
      case TipoProduto.higiene:
        return 'Higiene';
      case TipoProduto.limpeza:
        return 'Limpeza';
      case TipoProduto.outros:
        return 'Outros';
      default:
        return name; // Retorna o nome da enumeração como fallback
    }
  }
  static TipoProduto fromString(String? tipoStr) {
    if (tipoStr == null) return TipoProduto.outros; // Valor padrão
    return TipoProduto.values.firstWhere(
      (e) => e.name == tipoStr,
      orElse: () => TipoProduto.outros, // Valor padrão se não encontrar
    );
  }
}
