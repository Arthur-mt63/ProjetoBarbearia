
class ServicoBarbeiro {
  int? idServico;
  int idBarbeiro;
  String nomeServico;
  String foto;
  double valor;

  ServicoBarbeiro({
    this.idServico,
    required this.idBarbeiro,
    required this.nomeServico,
    required this.foto,
    required this.valor,
  });

  // Método toMap para converter o objeto ServicoBarbeiro em um Map
  Map<String, dynamic> toMap() {
    return {
      'idServico': idServico,
      'idBarbeiro': idBarbeiro, // Converte o objeto Barbeiro em Map
      'nomeServico': nomeServico,
      'foto': foto,
      'valor': valor,
    };
  }

  // Método factory fromMap para criar um objeto ServicoBarbeiro a partir de um Map
  factory ServicoBarbeiro.fromMap(Map<String, dynamic> map) {
    return ServicoBarbeiro(
      idServico: map['idServico'] as int?,
      idBarbeiro: map['idBarbeiro'] as int, 
      nomeServico: map['nomeServico'] as String,
      foto: map['foto'] as String,
      valor: (map['valor'] as num).toDouble(), // Converte num para double
    );
  }
}
