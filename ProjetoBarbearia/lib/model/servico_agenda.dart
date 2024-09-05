class ServicoAgendamento {
  int? idServicoAgen;
  int idServico;
  int idAgendamento;
  DateTime dataServicoAgend;
  DateTime horaServico;
  double valorServico;
  String? avaliacao;

  ServicoAgendamento({
    this.idServicoAgen,
    required this.idServico,
    required this.idAgendamento,
    required this.dataServicoAgend,
    required this.horaServico,
    required this.valorServico,
    this.avaliacao,
  });

  // Método toMap para converter o objeto ServicoAgendamento em um Map
  Map<String, dynamic> toMap() {
    return {
      'idServicoAgen': idServicoAgen,
      'idServico': idServico,
      'idAgendamento': idAgendamento,
      'dataServicoAgend': dataServicoAgend.toIso8601String(), // Converte a data para uma string ISO 8601
      'horaServico': horaServico.toIso8601String(), // Converte a hora para uma string ISO 8601
      'valorServico': valorServico,
      'avaliacao': avaliacao,
    };
  }

  // Método factory fromMap para criar um objeto ServicoAgendamento a partir de um Map
  factory ServicoAgendamento.fromMap(Map<String, dynamic> map) {
    return ServicoAgendamento(
      idServicoAgen: map['idServicoAgen'] as int?,
      idServico: map['idServico'] as int,
      idAgendamento: map['idAgendamento'] as int,
      dataServicoAgend: DateTime.parse(map['dataServicoAgend'] as String), // Converte a string ISO 8601 de volta para DateTime
      horaServico: DateTime.parse(map['horaServico'] as String), // Converte a string ISO 8601 de volta para DateTime
      valorServico: (map['valorServico'] as num).toDouble(), // Converte num para double
      avaliacao: map['avaliacao'] as String?,
    );
  }
}
