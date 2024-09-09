class ServicoAgendamento {
  int? idServicoAgen;
  int? idServico;
  int? idAgendamento;
  DateTime? dataServicoAgend;
  DateTime? horaServico;
  double? valorServico;
  String? avaliacao;

  // Construtor
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
  Map<String, dynamic> toMap() {
    return {
      'idServicoAgen': idServicoAgen,
      'idServico': idServico,
      'idAgendamento': idAgendamento,
      'dataServicoAgend': dataServicoAgend,
      'horaServico': horaServico,
      'valorServico': valorServico,
      'avaliacao': avaliacao,
    };
  }

  // Método que cria uma instância de ServicoAgendamento a partir de um Map
  factory ServicoAgendamento.fromMap(Map<String, dynamic> map) {
    return ServicoAgendamento(
      idServicoAgen: map['idServicoAgen'],
      idServico: map['idServico'],
      idAgendamento: map['idAgendamento'],
      dataServicoAgend: map['dataServicoAgend'],
      horaServico: map['horaServico'],
      valorServico: map['valorServico'],
      avaliacao: map['avaliacao'],
    );
  }
}
