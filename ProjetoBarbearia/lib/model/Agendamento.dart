class Agendamento {
  int? idAgendamento; // Número de identificação único para o agendamento
  int? idCliente; // Número de identificação do cliente que fez o agendamento
  DateTime? dataAgen; // Data marcada para o agendamento
  double? valorTotal; // Valor total do agendamento

  // Este é o "construtor". Ele é chamado quando queremos criar um novo agendamento.
  // Aqui, podemos passar os detalhes do agendamento, como o ID, ID do cliente, data e valor.
  Agendamento({
    this.idAgendamento,
    this.idCliente,
    this.dataAgen,
    this.valorTotal,
  });

  // Este método transforma o agendamento em um "mapa", que é como uma lista de informações.
  // Cada informação tem um nome (como 'idAgendamento') e um valor (como o número do ID).
  // Isso é útil, por exemplo, para guardar o agendamento em um banco de dados.
  Map<String, dynamic> toMap() {
    return {
      'idAgendamento': idAgendamento, // Guardar o número do ID do agendamento
      'idCliente': idCliente, // Guardar o número do ID do cliente
      'dataAgen': dataAgen, // Guardar a data do agendamento
      'valorTotal': valorTotal, // Guardar o valor total do agendamento
    };
  }

  // Este é um "método fábrica", que cria um novo agendamento a partir de um mapa de informações.
  // Imagine que temos uma lista com os detalhes do agendamento. Este método pega esses detalhes e cria um agendamento com eles.
  factory Agendamento.fromMap(Map<String, dynamic> map) {
    return Agendamento(
      idAgendamento: map['idAgendamento'], // Pegar o número do ID do agendamento da lista
      idCliente: map['idCliente'], // Pegar o número do ID do cliente da lista
      dataAgen: map['dataAgen'], // Pegar a data do agendamento da lista
      valorTotal: map['valorTotal'], // Pegar o valor total do agendamento da lista
    );
  }
}