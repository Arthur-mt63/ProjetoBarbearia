class EnderecoCliente {
  int? idEnderecoCliente;
  int idCliente; 
  String bairro;
  String rua;
  String cep;
  String complemento;
  String? numero;

  EnderecoCliente({
    this.idEnderecoCliente,
    required this.idCliente, 
    required this.bairro,
    required this.rua, 
    required this.cep,
    required this.complemento,
    this.numero,
  });

  // Método para converter o objeto EnderecoCliente em um Map<String, dynamic>
  Map<String, dynamic> toMap() {
    return {
      'idEnderecoCliente': idEnderecoCliente,
      'idCliente': idCliente,
      'bairro': bairro,
      'rua': rua,
      'cep': cep,
      'complemento': complemento,
      'numero': numero,
    };
  }

  // Método factory para criar uma instância de EnderecoCliente a partir de um Map<String, dynamic>
  factory EnderecoCliente.fromMap(Map<String, dynamic> map) {
    return EnderecoCliente(
      idEnderecoCliente: map['idEnderecoCliente'] as int?,
      idCliente: map['idCliente'] as int,
      bairro: map['bairro'] as String,
      rua: map['rua'] as String,
      cep: map['cep'] as String,
      complemento: map['complemento'] as String,
      numero: map['numero'] as String?,
    );
  }
}
