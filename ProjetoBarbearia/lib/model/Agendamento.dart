class Agendamento {
  int? idAgendamento;
  int? idCliente;
  DateTime? dataAgen;
  double? valorTotal;
  //  construtor - chamada da classe que recebe os dados
  Agendamento(
      {this.idAgendamento, this.idCliente, this.dataAgen, this.valorTotal});
  // (this) referencia uos de variavel local (contida na classe)

  // metodo que converte o objeto user map , ele pega os valores
  //passados e converte ele para as variaveis
  Map<String, dynamic> toMap() {
    return {
      'idAgendamento': idAgendamento,
      'idCliente': idCliente,
      'dataAgen': dataAgen,
      'valorTotal': valorTotal,
    };
  }

  // cria um objeto de uso da classe , a partir de um map
  factory Agendamento.fromMap(Map<String, dynamic> map) {
    return Agendamento(
      idAgendamento: map['idAgendamento'],
      idCliente: map['idCliente'],
      dataAgen: map['dataAgen'],
      valorTotal: map['valorTotal'],
    );
  }
}
