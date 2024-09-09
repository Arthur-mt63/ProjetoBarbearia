class ProdutoVenda {
  // Declaração de variáveis de instância que podem ser nulas
  int? idProdutoVenda; // Identificador único do relacionamento produto-venda
  int? idProduto; // Identificador do produto
  int? idVenda; // Identificador da venda

  // Construtor da classe ProdutoVenda
  // Permite inicializar uma instância da classe com valores para todos os atributos
  ProdutoVenda({
    this.idProdutoVenda,
    this.idProduto,
    this.idVenda,
  });

  // Método que converte o objeto ProdutoVenda em um Map
  // Útil para serializar o objeto, por exemplo, ao salvar em um banco de dados ou enviar via API
  Map<String, dynamic> toMap() {
    return {
      'idProdutoVenda': idProdutoVenda, // Atribui o valor de idProdutoVenda à chave 'idProdutoVenda' no mapa
      'idProduto': idProduto, // Atribui o valor de idProduto à chave 'idProduto' no mapa
      'idVenda': idVenda, // Atribui o valor de idVenda à chave 'idVenda' no mapa
    };
  }

  // Factory constructor que cria um objeto ProdutoVenda a partir de um Map
  // Útil para criar uma instância da classe usando dados armazenados em formato de mapa
  factory ProdutoVenda.fromMap(Map<String, dynamic> map) {
    return ProdutoVenda(
      idProdutoVenda: map['idProdutoVenda'], // Corrigido para extrair o valor de 'idProdutoVenda' do mapa e atribuir a idProdutoVenda
      idProduto: map['idProduto'], // Corrigido para extrair o valor de 'idProduto' do mapa e atribuir a idProduto
      idVenda: map['idVenda'], // Extrai o valor de 'idVenda' do mapa e atribui a idVenda
    );
  }
}
