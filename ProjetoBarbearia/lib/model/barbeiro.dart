class Barbeiro {
  final int? idBarbeiro;
  String? nomeBarbeiro;
  String? fotoBarbeiro;
  String? telefone;

  Barbeiro({
    this.idBarbeiro,
    this.nomeBarbeiro,
    this.fotoBarbeiro,
    this.telefone,
  });

  // Método para converter o objeto Barbeiro em um Map<String, dynamic>
  Map<String, dynamic> toMap() {
    return {
      'idBarbeiro': idBarbeiro,
      'nomeBarbeiro': nomeBarbeiro,
      'fotoBarbeiro': fotoBarbeiro,
      'telefone': telefone,
    };
  }

  // Método factory para criar uma instância de Barbeiro a partir de um Map<String, dynamic>
  factory Barbeiro.fromMap(Map<String, dynamic> map) {
    return Barbeiro(
      idBarbeiro: map['idBarbeiro'] as int?,
      nomeBarbeiro: map['nomeBarbeiro'] as String?,
      fotoBarbeiro: map['fotoBarbeiro'] as String?,
      telefone: map['telefone'] as String?,
    );
  }
}
