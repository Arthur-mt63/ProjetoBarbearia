class Cliente {
  int? idCliente;
  int? idUsuarioCli;

  Cliente({this.idCliente, this.idUsuarioCli});

  Map<String, dynamic> toMap() {
    return {'idCliente': idCliente, 'idUsuarioCli': idUsuarioCli};
  }

  factory Cliente.fromMap(Map<String, dynamic> map) {
    return Cliente(
        idCliente: map['idCliente'], idUsuarioCli: map['idUsuarioCli']);
  }
}
