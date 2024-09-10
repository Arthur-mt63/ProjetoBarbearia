class Repositorio {
  int? idRepositorio;
  int? idBarbeiro;

  Repositorio({
    this.idRepositorio,
    this.idBarbeiro,
  });

  Map<String, dynamic> toMap() {
    return {
      'idRepositorio': idRepositorio,
      'idBarbeiro': idBarbeiro,
    };
  }

  factory Repositorio.fromMap(Map<String, dynamic> map) {
    return Repositorio(
      idRepositorio: map['idRepositorio'],
      idBarbeiro: map['idBarbeiro'],
    );
  }
}
