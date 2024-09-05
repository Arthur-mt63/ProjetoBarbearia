class Loja {
  int? idLoja;
  int idBarbearia;

  Loja({
    this.idLoja,
    required this.idBarbearia,
  });

  // Método toMap para converter o objeto Loja em um Map
  Map<String, dynamic> toMap() {
    return {
      'idLoja': idLoja,
      'idBarbearia': idBarbearia,
    };
  }

  // Método factory fromMap para criar um objeto Loja a partir de um Map
  factory Loja.fromMap(Map<String, dynamic> map) {
    return Loja(
      idLoja: map['idLoja'] as int?,
      idBarbearia: map['idBarbearia'] as int,
    );
  }
}
