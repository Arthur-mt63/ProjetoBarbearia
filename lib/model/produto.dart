class Produto {
  int? idProduto;
  String nomeProduto;
  double precoUnitario;
  int quantProduto;
  String? descricaoProduto;
  String? fotoUrl;

  Produto({
    this.idProduto,
    required this.nomeProduto,
    required this.precoUnitario,
    required this.quantProduto,
    this.descricaoProduto,
    this.fotoUrl,
  });

  // Converte a instância da classe para um Map<String, dynamic>
  Map<String, dynamic> toMap() {
    return {
      'idProduto': idProduto,
      'nomeProduto': nomeProduto,
      'precoUnitario': precoUnitario,
      'quantProduto': quantProduto,
      'descricaoProduto': descricaoProduto,
      'fotoUrl': fotoUrl,
    };
  }

  // Cria uma instância da classe a partir de um Map<String, dynamic>
  factory Produto.fromMap(Map<String, dynamic> map) {
    return Produto(
      idProduto: map['idProduto'] as int?,
      nomeProduto: map['nomeProduto'] as String,
      precoUnitario: map['precoUnitario'] as double,
      quantProduto: map['quantProduto'] as int,
      descricaoProduto: map['descricaoProduto'] as String?,
      fotoUrl: map['fotoUrl'] as String?,
    );
  }
}