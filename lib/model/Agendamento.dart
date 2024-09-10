class Agendamento {
  int? idAgendamento;
  int idCliente;
  DateTime dataAgen;
  double valorTotal;

  Agendamento({
    this.idAgendamento,
    required this.idCliente,
    required this.dataAgen,
    required this.valorTotal,
  });

  // Método toMap para converter o objeto Agendamento em um Map
  Map<String, dynamic> toMap() {
    return {
      'idAgendamento': idAgendamento,
      'idCliente': idCliente,
      'dataAgen': dataAgen.toIso8601String(), // Converte a data para uma string ISO 8601
      'valorTotal': valorTotal,
    };
  }

  // Método factory fromMap para criar um objeto Agendamento a partir de um Map
  factory Agendamento.fromMap(Map<String, dynamic> map) {
    return Agendamento(
      idAgendamento: map['idAgendamento'] as int?,
      idCliente: map['idCliente'] as int,
      dataAgen: DateTime.parse(map['dataAgen'] as String), // Converte a string ISO 8601 de volta para DateTime
      valorTotal: (map['valorTotal'] as num).toDouble(), // Converte num para double
    );
  }
}