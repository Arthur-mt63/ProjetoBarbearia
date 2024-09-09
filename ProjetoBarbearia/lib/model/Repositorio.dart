class Repositorio {
  // Declaração de variáveis de instância que podem ser nulas
  int? idRepositorio; // Identificador único do repositório
  int? idBarbeiro; // Identificador do barbeiro associado ao repositório

  // Construtor da classe Repositorio
  // Permite inicializar uma instância da classe com valores para todos os atributos
  Repositorio({
    this.idRepositorio,
    this.idBarbeiro,
  });

  // Método que converte o objeto Repositorio em um Map
  // Útil para serializar o objeto, por exemplo, ao salvar em um banco de dados ou enviar via API
  Map<String, dynamic> toMap() {
    return {
      'idRepositorio': idRepositorio, // Atribui o valor de idRepositorio à chave 'idRepositorio' no mapa
      'idBarbeiro': idBarbeiro, // Atribui o valor de idBarbeiro à chave 'idBarbeiro' no mapa
    };
  }

  // Factory constructor que cria um objeto Repositorio a partir de um Map
  // Útil para criar uma instância da classe usando dados armazenados em formato de mapa
  factory Repositorio.fromMap(Map<String, dynamic> map) {
    return Repositorio(
      idRepositorio: map['idRepositorio'], // Extrai o valor de 'idRepositorio' do mapa e atribui a idRepositorio
      idBarbeiro: map['idBarbeiro'], // Extrai o valor de 'idBarbeiro' do mapa e atribui a idBarbeiro
    );
  }
}
