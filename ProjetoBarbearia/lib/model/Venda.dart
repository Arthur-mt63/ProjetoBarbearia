class Venda {
  int? idVenda;
  int? idCliente;
  DateTime? dataVenda;
  String? horaVenda;

  Venda({
    this.idVenda,
    this.idCliente,
    this.dataVenda,
    this.horaVenda,
  });

  Map<String, dynamic> toMap() {
    return {
      'idVenda': idVenda,
      'idCliente': idCliente,
      'dataVenda': dataVenda,
      'horaVenda': horaVenda,
    };
  }

  factory Venda.fromMap(Map<String, dynamic> map) {
    return Venda(
      idVenda: map['idVenda'],
      idCliente: map['idCliente'],
      dataVenda: map['dataVenda'],
      horaVenda: map['horaVenda'],
    );
  }
}
