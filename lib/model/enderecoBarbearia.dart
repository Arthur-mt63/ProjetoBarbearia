class EnderecoBarbearia {
  int? idEnderecoBarb;
  int idBarbearia;
  String bairro;
  String rua;
  String cep;
  String complemento;
  String? numero;

  EnderecoBarbearia({
    this.idEnderecoBarb,
    required this.idBarbearia,
    required this.bairro,
    required this.rua,
    required this.cep,
    required this.complemento,
    this.numero,
  });

  // Converte a instância da classe para um Map<String, dynamic>
  Map<String, dynamic> toMap() {
    return {
      'idEnderecoBarb': idEnderecoBarb,
      'idBarbearia': idBarbearia,
      'bairro': bairro,
      'rua': rua,
      'cep': cep,
      'complemento': complemento,
      'numero': numero,
    };
  }

  // Cria uma instância da classe a partir de um Map<String, dynamic>
  factory EnderecoBarbearia.fromMap(Map<String, dynamic> map) {
    return EnderecoBarbearia(
      idEnderecoBarb: map['idEnderecoBarb'] as int?,
      idBarbearia: map['idBarbearia'] as int,
      bairro: map['bairro'] as String,
      rua: map['rua'] as String,
      cep: map['cep'] as String,
      complemento: map['complemento'] as String,
      numero: map['numero'] as String?,
    );
  }
}