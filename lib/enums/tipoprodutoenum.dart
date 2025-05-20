enum TipoProdutoEnum {
  alimentos,
  frios,
  higiene,
  limpeza,
  outros;

  String get nomeAmigavel {
    switch (this) {
      case TipoProdutoEnum.alimentos:
        return 'Alimentos';
      case TipoProdutoEnum.frios:
        return 'Frios';
      case TipoProdutoEnum.higiene:
        return 'Higiene';
      case TipoProdutoEnum.limpeza:
        return 'Limpeza';
      case TipoProdutoEnum.outros:
        return 'Outros';
      default:
        return name; // Retorna o nome da enumeração como fallback
    }
  }
  static TipoProdutoEnum fromString(String? tipoStr) {
    if (tipoStr == null) return TipoProdutoEnum.outros; // Valor padrão
    return TipoProdutoEnum.values.firstWhere(
      (e) => e.name == tipoStr,
      orElse: () => TipoProdutoEnum.outros, // Valor padrão se não encontrar
    );
  }
}
