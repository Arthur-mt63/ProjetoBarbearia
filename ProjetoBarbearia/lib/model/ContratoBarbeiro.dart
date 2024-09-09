class contratoBarbeiro {
  int? idContratoBarbeiro;
  int? idBarbeiro;
  int? idBarbearia;

  contratoBarbeiro({
    this.idContratoBarbeiro,
    this.idBarbeiro,
    this.idBarbearia,
  });

  Map<String, dynamic> toMap() {
    return {
      'idContratoBarbeiro': idContratoBarbeiro,
      'idBarbeiro': idBarbeiro,
      'idBarbearia': idBarbearia,
    };
  }

  factory contratoBarbeiro.fromMap(Map<String, dynamic> map) {
    return contratoBarbeiro(
      idContratoBarbeiro: map['idContratoBabeiro'],
      idBarbearia: map['idBarbearia'],
      idBarbeiro: map['idBarbeiro'],
    );
  }
}
