class ProdutoLoja {
  // Declaração de variáveis de instância que podem ser nulas
  int? idProdutoLoja; // Identificador único do relacionamento produto-loja
  int? idLoja; // Identificador da loja
  int? idProduto; // Identificador do produto

  // Construtor da classe ProdutoLoja
  // Permite inicializar uma instância da classe com valores para todos os atributos
  ProdutoLoja({
    this.idProdutoLoja,
    this.idLoja,
    this.idProduto,
  });

  // Método que converte o objeto ProdutoLoja em um Map
  // Útil para serializar o objeto, por exemplo, ao salvar em um banco de dados ou enviar via API
  Map<String, dynamic> toMap() {
    return {
      'idProdutoLoja': idProdutoLoja, // Corrigido para atribuir o valor correto à chave 'idProdutoLoja'
      'idLoja': idLoja, // Atribui o valor de idLoja à chave 'idLoja' no mapa
      'idProduto': idProduto, // Corrigido para atribuir o valor correto à chave 'idProduto'
    };
  }

  // Factory constructor que cria um objeto ProdutoLoja a partir de um Map
  // Útil para criar uma instância da classe usando dados armazenados em formato de mapa
  factory ProdutoLoja.fromMap(Map<String, dynamic> map) {
    return ProdutoLoja(
      idProdutoLoja: map['idProdutoLoja'], // Extrai o valor de 'idProdutoLoja' do mapa e atribui a idProdutoLoja
      idLoja: map['idLoja'], // Extrai o valor de 'idLoja' do mapa e atribui a idLoja
      idProduto: map['idProduto'], // Extrai o valor de 'idProduto' do mapa e atribui a idProduto
    );
  }
}
