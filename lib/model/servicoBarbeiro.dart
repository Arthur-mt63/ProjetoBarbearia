class ServicoBarbeiro {
  int? idServico;
  int? idBarbeiro;
  String? nomeServico;
  String? foto;
  double? valor;

  // Construtor
  ServicoBarbeiro({
    this.idServico,
    this.idBarbeiro,
    this.nomeServico,
    this.foto,
    this.valor,
  });

  // Método que converte o objeto ServicoBarbeiro em um Map
  Map<String, dynamic> toMap() {
    return {
      'idServico': idServico,
      'idBarbeiro': idBarbeiro,
      'nomeServico': nomeServico,
      'foto': foto,
      'valor': valor,
    };
  }

  // Método que cria uma instância de ServicoBarbeiro a partir de um Map
  factory ServicoBarbeiro.fromMap(Map<String, dynamic> map) {
    return ServicoBarbeiro(
      idServico: map['idServico'],
      idBarbeiro: map['idBarbeiro'],
      nomeServico: map['nomeServico'],
      foto: map['foto'],
      valor: map['valor'],
    );
  }
}
