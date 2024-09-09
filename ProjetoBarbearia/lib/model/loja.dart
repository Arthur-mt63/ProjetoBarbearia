class Loja {
  // Declaração de variáveis de instância que podem ser nulas
  int? idLoja; // Identificador único da loja
  int? idBarbearia; // Identificador da barbearia associada à loja

  // Construtor da classe Loja
  // Permite inicializar uma instância da classe com valores para idLoja e idBarbearia
  Loja({
    this.idLoja,
    this.idBarbearia,
  });

  // Método que converte o objeto Loja em um Map
  // Útil para serializar o objeto, por exemplo, ao salvar em um banco de dados ou enviar via API
  Map<String, dynamic> toMap() {
    return {
      'idLoja': idLoja, // Atribui o valor de idLoja à chave 'idLoja' no mapa
      'idBarbearia': idBarbearia, // Atribui o valor de idBarbearia à chave 'idBarbearia' no mapa
    };
  }

  // Factory constructor que cria um objeto Loja a partir de um Map
  // Útil para criar uma instância da classe usando dados armazenados em formato de mapa
  factory Loja.fromMap(Map<String, dynamic> map) {
    return Loja(
      idLoja: map['idLoja'], // Extrai o valor de 'idLoja' do mapa e atribui a idLoja
      idBarbearia: map['idBarbearia'], // Extrai o valor de 'idBarbearia' do mapa e atribui a idBarbearia
    );
  }
}
