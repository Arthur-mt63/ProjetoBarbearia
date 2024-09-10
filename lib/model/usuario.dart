class Usuario {
  int? idUsuario;
  String? nome;
  String? cpf;
  String?
      dataNasc; // Pode ser String se a data for armazenada como texto no formato 'dd/MM/yyyy' ou 'yyyy-MM-dd'
  String? tipoUsuario;
  String? usuario;
  String? emailUsuario;
  String? senhaUsuario;
  String? bairro;
  String? cep;
  String? numero;
  String? complemento;

  // Construtor
  Usuario({
    this.idUsuario,
    this.nome,
    this.cpf,
    this.dataNasc,
    this.tipoUsuario,
    this.usuario,
    this.emailUsuario,
    this.senhaUsuario,
    this.bairro,
    this.cep,
    this.numero,
    this.complemento,
  });

  // Método que converte o objeto Usuario em um Map
  Map<String, dynamic> toMap() {
    return {
      'idUsuario': idUsuario,
      'nome': nome,
      'cpf': cpf,
      'dataNasc': dataNasc,
      'tipoUsuario': tipoUsuario,
      'usuario': usuario,
      'emailUsuario': emailUsuario,
      'senhaUsuario': senhaUsuario,
      'bairro': bairro,
      'cep': cep,
      'numero': numero,
      'complemento': complemento,
    };
  }

  // Método que cria uma instância de Usuario a partir de um Map
  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      idUsuario: map['idUsuario'],
      nome: map['nome'],
      cpf: map['cpf'],
      dataNasc: map['dataNasc'],
      tipoUsuario: map['tipoUsuario'],
      usuario: map['usuario'],
      emailUsuario: map['emailUsuario'],
      senhaUsuario: map['senhaUsuario'],
      bairro: map['bairro'],
      cep: map['cep'],
      numero: map['numero'],
      complemento: map['complemento'],
    );
  }
}
