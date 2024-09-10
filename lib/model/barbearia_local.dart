class Barbearia {
  int? idBarbearia;
  String nomeBarbearia;
  String nomeDono;
  String emailBar;
  String senhaBar;

  Barbearia({
    this.idBarbearia,
    required this.nomeBarbearia,
    required this.nomeDono,
    required this.emailBar,
    required this.senhaBar,
  });

  // Converte a instância da classe para um Map<String, dynamic>
  Map<String, dynamic> toMap() {
    return {
      'idBarbearia': idBarbearia,
      'nomeBarbearia': nomeBarbearia,
      'nomeDono': nomeDono,
      'emailBar': emailBar,
      'senhaBar': senhaBar,
    };
  }

  // Cria uma instância da classe a partir de um Map<String, dynamic>
  factory Barbearia.fromMap(Map<String, dynamic> map) {
    return Barbearia(
      idBarbearia: map['idBarbearia'] as int?,
      nomeBarbearia: map['nomeBarbearia'] as String,
      nomeDono: map['nomeDono'] as String,
      emailBar: map['emailBar'] as String,
      senhaBar: map['senhaBar'] as String,
    );
  }
}