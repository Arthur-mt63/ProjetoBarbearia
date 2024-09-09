class Cliente {
  // Declaração de variáveis de instância que podem ser nulas
  int? idCliente; // Identificador único do cliente
  int? idUsuarioCli; // Identificador do usuário associado ao cliente

  // Construtor da classe Cliente
  // Permite inicializar uma instância da classe com valores para idCliente e idUsuarioCli
  Cliente({
    this.idCliente,
    this.idUsuarioCli,
  });

  // Método que converte o objeto Cliente em um Map
  // Ele pega os valores dos atributos do objeto e os coloca em um mapa de chave-valor
  Map<String, dynamic> toMap() {
    return {
      'idCliente': idCliente, // Atribui o valor de idCliente à chave 'idCliente' no mapa
      'idUsuarioCli': idUsuarioCli, // Atribui o valor de idUsuarioCli à chave 'idUsuarioCli' no mapa
    };
  }

  // Factory constructor que cria um objeto Cliente a partir de um Map
  // Útil para criar uma instância da classe usando dados armazenados em formato de mapa
  factory Cliente.fromMap(Map<String, dynamic> map) {
    return Cliente(
      idCliente: map['idCliente'], // Extrai o valor de 'idCliente' do mapa e atribui a idCliente
      idUsuarioCli: map['idUsuarioCli'], // Extrai o valor de 'idUsuarioCli' do mapa e atribui a idUsuarioCli
    );
  }
}
