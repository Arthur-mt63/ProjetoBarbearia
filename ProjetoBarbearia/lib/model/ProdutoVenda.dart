class ProdutoVenda {
  int? idProdutoVenda;
  int idProduto;
  int idVenda;

  ProdutoVenda({
    this.idProdutoVenda,
    required this.idProduto,
    required this.idVenda,
  });

  // Converte a instância da classe para um Map<String, dynamic>
  Map<String, dynamic> toMap() {
    return {
      'idProdutoVenda': idProdutoVenda,
      'idProduto': idProduto,
      'idVenda': idVenda,
    };
  }

  // Cria uma instância da classe a partir de um Map<String, dynamic>
  factory ProdutoVenda.fromMap(Map<String, dynamic> map) {
    return ProdutoVenda(
      idProdutoVenda: map['idProdutoVenda'] as int?,
      idProduto: map['idProduto'] as int,
      idVenda: map['idVenda'] as int,
    );
  }
}
