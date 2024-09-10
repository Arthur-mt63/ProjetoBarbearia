

class ContratoBarbeiro {
  int? idContratoBarbeiro;
  int idBarbeiro;
  int idBarbearia;

  ContratoBarbeiro({this.idContratoBarbeiro,
    required this.idBarbeiro,
    required this.idBarbearia}
  );

  // Método toMap para converter o objeto ContratoBarbeiro em um Map
  Map<String, dynamic> toMap() {
    return {
      'idContratoBarbeiro': idContratoBarbeiro,
      'barbeiro': idBarbeiro, // Converte o objeto Barbeiro em Map
      'barbearia': idBarbearia, // Converte o objeto Barbearia em Map
    };
  }

  // Método factory fromMap para criar um objeto ContratoBarbeiro a partir de um Map
  factory ContratoBarbeiro.fromMap(Map<String, dynamic> map) {
    return ContratoBarbeiro(
      idContratoBarbeiro: map['idContratoBarbeiro'] as int?,
      idBarbeiro: map['barbeiro'] as int,
      idBarbearia: map['barbearia'] as int,
    );
  }

}