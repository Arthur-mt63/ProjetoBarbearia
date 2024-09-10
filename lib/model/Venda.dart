class Venda {
  int? idVenda;
  int idCliente;
  DateTime dataVenda;
  String horaVenda;

  Venda({
    this.idVenda,
    required this.idCliente,
    required this.dataVenda,
    required this.horaVenda,
  });

  // Converte a instância da classe para um Map<String, dynamic>
  Map<String, dynamic> toMap() {
    return {
      'idVenda': idVenda,
      'idCliente': idCliente,
      'dataVenda': dataVenda.toIso8601String(),
      'horaVenda': horaVenda,
    };
  }

  // Cria uma instância da classe a partir de um Map<String, dynamic>
  factory Venda.fromMap(Map<String, dynamic> map) {
    return Venda(
      idVenda: map['idVenda'] as int?,
      idCliente: map['idCliente'] as int,
      dataVenda: DateTime.parse(map['dataVenda'] as String),
      horaVenda: map['horaVenda'] as String,
    );
  }
}