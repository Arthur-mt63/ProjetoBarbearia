class Barbearia {
  int? idBarbearia;
  int? proprietario;
  String? nomeBarbearia;
  String? bairro;
  int? cep;
  String? rua;
  int? numero;
  String? complemento;

  Barbearia(
      {this.idBarbearia,
      this.proprietario,
      this.nomeBarbearia,
      this.bairro,
      this.cep,
      this.rua,
      this.numero,
      this.complemento});

  Map<String, dynamic> toMap() {
    return {
      'idBarbearia': idBarbearia,
      'proprietario': proprietario,
      'nomeBarbearia': nomeBarbearia,
      'bairro': bairro,
      'cep': cep,
      'rua': rua,
      'numero': numero,
      'complemento': complemento
    };
  }

  factory Barbearia.fromMap(Map<String, dynamic> map) {
    return Barbearia(
        idBarbearia: map['idBarbearia'],
        proprietario: map['proprietario'],
        nomeBarbearia: map['nomeBarbearia'],
        bairro: map['bairro'],
        cep: map['cep'],
        rua: map['rua'],
        numero: map['numero'],
        complemento: map['complemento']);
  }
}
