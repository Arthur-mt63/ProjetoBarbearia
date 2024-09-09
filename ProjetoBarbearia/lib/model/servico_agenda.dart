class ServicoAgendamento {
  // Declaração de variáveis de instância que podem ser nulas
  int? idServicoAgen; // Identificador único do serviço agendado
  int? idServico; // Identificador do serviço
  int? idAgendamento; // Identificador do agendamento
  DateTime? dataServicoAgend; // Data do serviço agendado
  DateTime? horaServico; // Hora do serviço agendado
  double? valorServico; // Valor do serviço
  String? avaliacao; // Avaliação do serviço

  // Construtor da classe ServicoAgendamento
  // Permite inicializar uma instância da classe com valores para todos os atributos
  ServicoAgendamento({
    this.idServicoAgen,
    this.idServico,
    this.idAgendamento,
    this.dataServicoAgend,
    this.horaServico,
    this.valorServico,
    this.avaliacao,
  });

  // Método que converte o objeto ServicoAgendamento em um Map
  // Útil para serializar o objeto, por exemplo, ao salvar em um banco de dados ou enviar via API
  Map<String, dynamic> toMap() {
    return {
      'idServicoAgen': idServicoAgen, // Atribui o valor de idServicoAgen à chave 'idServicoAgen' no mapa
      'idServico': idServico, // Atribui o valor de idServico à chave 'idServico' no mapa
      'idAgendamento': idAgendamento, // Atribui o valor de idAgendamento à chave 'idAgendamento' no mapa
      'dataServicoAgend': dataServicoAgend?.toIso8601String(), // Converte DateTime para string ISO 8601
      'horaServico': horaServico?.toIso8601String(), // Converte DateTime para string ISO 8601
      'valorServico': valorServico, // Atribui o valor de valorServico à chave 'valorServico' no mapa
      'avaliacao': avaliacao, // Atribui o valor de avaliacao à chave 'avaliacao' no mapa
    };
  }

  // Factory constructor que cria uma instância de ServicoAgendamento a partir de um Map
  // Útil para criar uma instância da classe usando dados armazenados em formato de mapa
  factory ServicoAgendamento.fromMap(Map<String, dynamic> map) {
    return ServicoAgendamento(
      idServicoAgen: map['idServicoAgen'], // Extrai o valor de 'idServicoAgen' do mapa e atribui a idServicoAgen
      idServico: map['idServico'], // Extrai o valor de 'idServico' do mapa e atribui a idServico
      idAgendamento: map['idAgendamento'], // Extrai o valor de 'idAgendamento' do mapa e atribui a idAgendamento
      dataServicoAgend: map['dataServicoAgend'] != null ? DateTime.parse(map['dataServicoAgend']) : null, // Converte string para DateTime, se não for nulo
      horaServico: map['horaServico'] != null ? DateTime.parse(map['horaServico']) : null, // Converte string para DateTime, se não for nulo
      valorServico: map['valorServico'], // Extrai o valor de 'valorServico' do mapa e atribui a valorServico
      avaliacao: map['avaliacao'], // Extrai o valor de 'avaliacao' do mapa e atribui a avaliacao
    );
  }
}
