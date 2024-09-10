class EnderecoUsuario {
  int? idEnderecoUsuario;
  int? idUsuario;
  String? bairro;
  String? cep;
  String? numero;
  String? complemento;

  EnderecoUsuario({
    this.idEnderecoUsuario,
    this.idUsuario,
    this.bairro,
    this.cep,
    this.numero,
    this.complemento,
  });

  Map<String, dynamic> toMap() {
    return {
      'idEnderecoUsuario': idEnderecoUsuario,
      'idUsuario': idUsuario,
      'bairro': bairro,
      'cep': cep,
      'numero': numero,
      'complemento': complemento,
    };
  }

  factory EnderecoUsuario.fromMap(Map<String, dynamic> map) {
    return EnderecoUsuario(
      idEnderecoUsuario: map['idEnderecoUsuario'],
      idUsuario: map['idUsuario'],
      bairro: map['bairro'],
      cep: map['cep'],
      numero: map['numero'],
      complemento: map['complemeto'],
    );
  }
}
