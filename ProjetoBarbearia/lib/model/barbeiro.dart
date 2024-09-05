class Barbeiro {
  int? idBarbeiro;
  int? idUsuario;

  Barbeiro({this.idBarbeiro, this.idUsuario});

  Map<String, dynamic> toMap() {
    return {'idBarbeiro': idBarbeiro, 'idUsuario': idUsuario};
  }

  factory Barbeiro.fromMap(Map<String, dynamic> map) {
    return Barbeiro(idBarbeiro: map['idBarbeiro'], idUsuario: map['idUsuario']);
  }
}
