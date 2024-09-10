class ProdutoLoja {
  int? idProdutoLoja;
  int? idLoja;
  int? idProduto;

  ProdutoLoja({
    this.idProdutoLoja,
    this.idLoja,
    this.idProduto,
  });

  Map<String, dynamic> toMap() {
    return {
      'idProdutoLoja': idProduto,
      'idLoja': idLoja,
      'idProduto': idProdutoLoja,
    };
  }

  factory ProdutoLoja.fromMap(Map<String, dynamic> map) {
    return ProdutoLoja(
      idProdutoLoja: map['idProdutoLoja'],
      idLoja: map['idLoja'],
      idProduto: map['idProduto'],
    );
  }
}
