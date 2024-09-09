class Usuario {
  // Declaração de variáveis de instância que podem ser nulas
  int? idUsuario; // Identificador único do usuário
  String? nome; // Nome do usuário
  int? cpf; // CPF do usuário
  DateTime? dataNasc; // Data de nascimento do usuário
  String? tipoUsuario; // Tipo de usuário (por exemplo, "admin", "cliente", etc.)
  String? usuario; // Nome de usuário ou login
  String? emailUsuario; // Email do usuário
  String? senhaUsuario; // Senha do usuário
  String? bairro; // Bairro onde o usuário reside
  int? cep; // CEP do endereço do usuário
  int? numero; // Número do endereço do usuário
  String? complemento; // Complemento do endereço do usuário (por exemplo, apartamento, bloco, etc.)

  // Construtor da classe Usuario
  // Permite inicializar uma instância da classe com valores para todos os atributos
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
  // Útil para serializar o objeto, por exemplo, ao salvar em um banco de dados ou enviar via API
  Map<String, dynamic> toMap() {
    return {
      'idUsuario': idUsuario, // Atribui o valor de idUsuario à chave 'idUsuario' no mapa
      'nome': nome, // Atribui o valor de nome à chave 'nome' no mapa
      'cpf': cpf, // Atribui o valor de cpf à chave 'cpf' no mapa
      'dataNasc': dataNasc?.toIso8601String(), // Converte DateTime para string ISO 8601, se não for nulo
      'tipoUsuario': tipoUsuario, // Atribui o valor de tipoUsuario à chave 'tipoUsuario' no mapa
      'usuario': usuario, // Atribui o valor de usuario à chave 'usuario' no mapa
      'emailUsuario': emailUsuario, // Atribui o valor de emailUsuario à chave 'emailUsuario' no mapa
      'senhaUsuario': senhaUsuario, // Atribui o valor de senhaUsuario à chave 'senhaUsuario' no mapa
      'bairro': bairro, // Atribui o valor de bairro à chave 'bairro' no mapa
      'cep': cep, // Atribui o valor de cep à chave 'cep' no mapa
      'numero': numero, // Atribui o valor de numero à chave 'numero' no mapa
      'complemento': complemento, // Atribui o valor de complemento à chave 'complemento' no mapa
    };
  }

  // Factory constructor que cria uma instância de Usuario a partir de um Map
  // Útil para criar uma instância da classe usando dados armazenados em formato de mapa
  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      idUsuario: map['idUsuario'], // Extrai o valor de 'idUsuario' do mapa e atribui a idUsuario
      nome: map['nome'], // Extrai o valor de 'nome' do mapa e atribui a nome
      cpf: map['cpf'], // Extrai o valor de 'cpf' do mapa e atribui a cpf
      dataNasc: map['dataNasc'] != null ? DateTime.parse(map['dataNasc']) : null, // Converte string para DateTime, se não for nulo
      tipoUsuario: map['tipoUsuario'], // Extrai o valor de 'tipoUsuario' do mapa e atribui a tipoUsuario
      usuario: map['usuario'], // Extrai o valor de 'usuario' do mapa e atribui a usuario
      emailUsuario: map['emailUsuario'], // Extrai o valor de 'emailUsuario' do mapa e atribui a emailUsuario
      senhaUsuario: map['senhaUsuario'], // Extrai o valor de 'senhaUsuario' do mapa e atribui a senhaUsuario
      bairro: map['bairro'], // Extrai o valor de 'bairro' do mapa e atribui a bairro
      cep: map['cep'], // Extrai o valor de 'cep' do mapa e atribui a cep
      numero: map['numero'], // Extrai o valor de 'numero' do mapa e atribui a numero
      complemento: map['complemento'], // Extrai o valor de 'complemento' do mapa e atribui a complemento
    );
  }
}
