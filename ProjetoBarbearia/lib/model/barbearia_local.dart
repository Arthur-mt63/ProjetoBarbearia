
class Barbearia {
  int? idBarbearia;
  int proprietario;
  String nomeBarbearia;
  String bairro;
  String cep;
  String rua;
  String numero;
  String complemento;

  Barbearia(
      {this.idBarbearia,
      required this.proprietario,
      required this.nomeBarbearia,
      required this.bairro,
      required this.cep,
      required this.rua,
      required this.numero,
      required this.complemento});

  // Método toMap para converter o objeto Barbearia em um Map
  Map<String, dynamic> toMap() {
    return {
      'idBarbearia': idBarbearia,
      'proprietario': proprietario, // Assuming Barbeiro has a toMap method
      'nomeBarbearia': nomeBarbearia,
      'bairro': bairro,
      'cep': cep,
      'rua': rua,
      'numero': numero,
      'complemento': complemento,
    };
  }

  // Método factory fromMap para criar um objeto Barbearia a partir de um Map
  factory Barbearia.fromMap(Map<String, dynamic> map) {
    return Barbearia(
      idBarbearia: map['idBarbearia'] as int?,
      proprietario: map['proprietario'] as int,
      nomeBarbearia: map['nomeBarbearia'] as String,
      bairro: map['bairro'] as String,
      cep: map['cep'] as String,
      rua: map['rua'] as String,
      numero: map['numero'] as String,
      complemento: map['complemento'] as String,
    );
  }    
}
