class Cliente {
  int? idCliente;
  String nomeCliente;
  String cpf;
  DateTime dataNasc;
  String usuario;
  String emailUsuario;
  String senhaUsuario;
  String? telefone;

  Cliente({
    this.idCliente,
    required this.nomeCliente,
    required this.cpf,
    required this.dataNasc,
    required this.usuario,
    required this.emailUsuario,
    required this.senhaUsuario,
    this.telefone,
  });

  // Método para converter o objeto Cliente em um Map<String, dynamic>
  Map<String, dynamic> toMap() {
    return {
      'idCliente': idCliente,
      'nomeCli': nomeCliente,
      'cpf': cpf,
      'dataNasc': dataNasc.toIso8601String(),
      'usuario': usuario,
      'emailCli': emailUsuario,
      'senhaCli': senhaUsuario,
      'telefone': telefone,
    };
  }

  // Método para converter apenas o idCliente em um Map<String, dynamic>
  Map<String, dynamic> toMapIdCliente() {
    return {
      'idCliente': idCliente,
    };
  }

  // Método factory para criar uma instância de Cliente a partir de um Map<String, dynamic>
  factory Cliente.fromMap(Map<String, dynamic> map) {
    return Cliente(
      idCliente: map['idCliente'] as int?,
      nomeCliente: map['nomeCli'] as String,
      cpf: map['cpf'] as String,
      dataNasc: DateTime.parse(map['dataNasc'] as String),
      usuario: map['usuario'] as String,
      emailUsuario: map['emailCli'] as String,
      senhaUsuario: map['senhaCli'] as String,
      telefone: map['telefone'] as String?,
    );
  }

}