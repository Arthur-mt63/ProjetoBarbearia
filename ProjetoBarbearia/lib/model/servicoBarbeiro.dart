class ServicoBarbeiro {
  // Declaração de variáveis de instância que podem ser nulas
  int? idServico; // Identificador único do serviço
  int? idBarbeiro; // Identificador do barbeiro associado ao serviço
  String? nomeServico; // Nome do serviço
  String? foto; // URL ou caminho da foto do serviço
  double? valor; // Valor do serviço

  // Construtor da classe ServicoBarbeiro
  // Permite inicializar uma instância da classe com valores para todos os atributos
  ServicoBarbeiro({
    this.idServico,
    this.idBarbeiro,
    this.nomeServico,
    this.foto,
    this.valor,
  });

  // Método que converte o objeto ServicoBarbeiro em um Map
  // Útil para serializar o objeto, por exemplo, ao salvar em um banco de dados ou enviar via API
  Map<String, dynamic> toMap() {
    return {
      'idServico': idServico, // Atribui o valor de idServico à chave 'idServico' no mapa
      'idBarbeiro': idBarbeiro, // Atribui o valor de idBarbeiro à chave 'idBarbeiro' no mapa
      'nomeServico': nomeServico, // Atribui o valor de nomeServico à chave 'nomeServico' no mapa
      'foto': foto, // Atribui o valor de foto à chave 'foto' no mapa
      'valor': valor, // Atribui o valor de valor à chave 'valor' no mapa
    };
  }

  // Factory constructor que cria uma instância de ServicoBarbeiro a partir de um Map
  // Útil para criar uma instância da classe usando dados armazenados em formato de mapa
  factory ServicoBarbeiro.fromMap(Map<String, dynamic> map) {
    return ServicoBarbeiro(
      idServico: map['idServico'], // Extrai o valor de 'idServico' do mapa e atribui a idServico
      idBarbeiro: map['idBarbeiro'], // Extrai o valor de 'idBarbeiro' do mapa e atribui a idBarbeiro
      nomeServico: map['nomeServico'], // Extrai o valor de 'nomeServico' do mapa e atribui a nomeServico
      foto: map['foto'], // Extrai o valor de 'foto' do mapa e atribui a foto
      valor: map['valor'], // Extrai o valor de 'valor' do mapa e atribui a valor
    );
  }
}
