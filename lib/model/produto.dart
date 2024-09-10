class Produto {
  int? idProduto;
  String? nomeProduto;
  double? precoUnitario;
  int? quantProduto;
  String? descricaoProduto;

  Produto({
    this.idProduto,
    this.nomeProduto,
    this.precoUnitario,
    this.quantProduto,
    this.descricaoProduto,
  });

  Map<String, dynamic> toMap() {
    return {
      'idProduto': idProduto,
      'nomeProduto': nomeProduto,
      'precoUnitario': precoUnitario,
      'quantProduto': quantProduto,
      'descricaoProduto': descricaoProduto,
    };
  }

  factory Produto.fromMap(Map<String, dynamic> map) {
    return Produto(
      idProduto: map['idProduto'],
      nomeProduto: map['nomeProduto'],
      precoUnitario: map['precoUnitario'],
      quantProduto: map['quantProduto'],
      descricaoProduto: map['descricaoPreco'],
    );
  }
}
