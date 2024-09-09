class Produto {
  // Declaração de variáveis de instância que podem ser nulas
  int? idProduto; // Identificador único do produto
  String? nomeProduto; // Nome do produto
  double? precoUnitario; // Preço unitário do produto
  int? quantProduto; // Quantidade do produto em estoque
  String? descricaoProduto; // Descrição detalhada do produto

  // Construtor da classe Produto
  // Permite inicializar uma instância da classe com valores para todos os atributos
  Produto({
    this.idProduto,
    this.nomeProduto,
    this.precoUnitario,
    this.quantProduto,
    this.descricaoProduto,
  });

  // Método que converte o objeto Produto em um Map
  // Útil para serializar o objeto, por exemplo, ao salvar em um banco de dados ou enviar via API
  Map<String, dynamic> toMap() {
    return {
      'idProduto': idProduto, // Atribui o valor de idProduto à chave 'idProduto' no mapa
      'nomeProduto': nomeProduto, // Atribui o valor de nomeProduto à chave 'nomeProduto' no mapa
      'precoUnitario': precoUnitario, // Atribui o valor de precoUnitario à chave 'precoUnitario' no mapa
      'quantProduto': quantProduto, // Atribui o valor de quantProduto à chave 'quantProduto' no mapa
      'descricaoProduto': descricaoProduto, // Atribui o valor de descricaoProduto à chave 'descricaoProduto' no mapa
    };
  }

  // Factory constructor que cria um objeto Produto a partir de um Map
  // Útil para criar uma instância da classe usando dados armazenados em formato de mapa
  factory Produto.fromMap(Map<String, dynamic> map) {
    return Produto(
      idProduto: map['idProduto'], // Extrai o valor de 'idProduto' do mapa e atribui a idProduto
      nomeProduto: map['nomeProduto'], // Extrai o valor de 'nomeProduto' do mapa e atribui a nomeProduto
      precoUnitario: map['precoUnitario'], // Extrai o valor de 'precoUnitario' do mapa e atribui a precoUnitario
      quantProduto: map['quantProduto'], // Extrai o valor de 'quantProduto' do mapa e atribui a quantProduto
      descricaoProduto: map['descricaoProduto'], // Corrigido para extrair 'descricaoProduto' do mapa
    );
  }
}
