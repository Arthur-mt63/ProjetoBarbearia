class Contratobarbeiro {
  // Declaração de variáveis de instância que podem ser nulas
  int? idContratoBarbeiro; // Identificador único do contrato do barbeiro
  int? idBarbeiro; // Identificador do barbeiro associado ao contrato
  int? idBarbearia; // Identificador da barbearia associada ao contrato

  // Construtor da classe contratoBarbeiro
  // Permite inicializar uma instância da classe com valores para idContratoBarbeiro, idBarbeiro e idBarbearia
  Contratobarbeiro({
    this.idContratoBarbeiro, 
    required idBarbeiro, 
   required idBarbearia,
  });

  // Método que converte o objeto contratoBarbeiro em um Map
  // Útil para serializar o objeto, por exemplo, ao salvar em um banco de dados ou enviar via API
  Map<String, dynamic> toMap() {
    return {
      'idContratoBarbeiro': idContratoBarbeiro, // Atribui o valor de idContratoBarbeiro à chave 'idContratoBarbeiro'
      'idBarbeiro': idBarbeiro, // Atribui o valor de idBarbeiro à chave 'idBarbeiro'
      'idBarbearia': idBarbearia, // Atribui o valor de idBarbearia à chave 'idBarbearia'
    };
  }

  // Factory constructor que cria um objeto contratoBarbeiro a partir de um Map
  // Útil para criar uma instância da classe usando dados armazenados em formato de mapa
  factory Contratobarbeiro.fromMap(Map<String, dynamic> map) {
    return Contratobarbeiro(
      idContratoBarbeiro: map['idContratoBarbeiro'], // Corrigido para extrair 'idContratoBarbeiro' do mapa
      idBarbeiro: map[''],
      idBarbearia: map[''],// Extrai o valor de 'idBarbearia' do mapa e atribui a idBarbearia
    );
  }
}
