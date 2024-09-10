class ProdutoVenda {
  int? idProdutoVenda;
  int? idProduto;
  int? idVenda;

  ProdutoVenda({
    this.idProdutoVenda,
    this.idProduto,
    this.idVenda,
  });

  Map<String, dynamic> toMap() {
    return {
      'idProdutoVenda': idProdutoVenda,
      'idProduto': idProduto,
      'idVenda': idVenda,
    };
  }

  factory ProdutoVenda.fromMap(Map<String, dynamic> map) {
    return ProdutoVenda(
      idProduto: map['idProdutoVenda'],
      idProdutoVenda: map['idProduto'],
      idVenda: map['idVenda'],
    );
  }
}
