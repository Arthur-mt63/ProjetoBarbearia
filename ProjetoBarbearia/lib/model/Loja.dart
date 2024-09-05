class Loja {
  int? idLoja;
  int? idBarbearia;

  Loja({
    this.idLoja,
    this.idBarbearia,
  });

  Map<String, dynamic> toMap() {
    return {
      'idLoja': idLoja,
      'idBarbearia': idBarbearia,
    };
  }

  factory Loja.fromMap(Map<String, dynamic> map) {
    return Loja(
      idLoja: map['idLoja'],
      idBarbearia: map['idBarbearia'],
    );
  }
}
