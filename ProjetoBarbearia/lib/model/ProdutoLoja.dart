class ProdutoLoja {
  int? idProdutoLoja;
  int idLoja;
  int idProduto;

  ProdutoLoja({
    this.idProdutoLoja,
    required this.idLoja,
    required this.idProduto,
  });

  // Converte a instância da classe para um Map<String, dynamic>
  Map<String, dynamic> toMap() {
    return {
      'idProdutoLoja': idProdutoLoja,
      'idLoja': idLoja,
      'idProduto': idProduto,
    };
  }

  // Cria uma instância da classe a partir de um Map<String, dynamic>
  factory ProdutoLoja.fromMap(Map<String, dynamic> map) {
    return ProdutoLoja(
      idProdutoLoja: map['idProdutoLoja'] as int?,
      idLoja: map['idLoja'] as int,
      idProduto: map['idProduto'] as int,
    );
  }
}
