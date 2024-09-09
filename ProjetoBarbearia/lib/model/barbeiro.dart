class Barbeiro {
  // Declaração de variáveis de instância que podem ser nulas
  // ? indica que essas variáveis são opcionais e podem conter um valor nulo
  int? idBarbeiro; 
  int? idUsuario; 

  // Construtor da classe Barbeiro
  // Permite criar uma instância da classe com valores para idBarbeiro e idUsuario
  Barbeiro({
    this.idBarbeiro,
    this.idUsuario,
  });

  // Método para converter a instância de Barbeiro em um mapa
  // Map<String, dynamic> é uma estrutura de dados que associa chaves (String) a valores (dynamic)
  Map<String, dynamic> toMap() {
    return {
      'idBarbeiro': idBarbeiro, // Atribui o valor de idBarbeiro à chave 'idBarbeiro'
      'idUsuario': idUsuario,   // Atribui o valor de idUsuario à chave 'idUsuario'
    };
  }

  // Factory constructor que cria uma instância de Barbeiro a partir de um mapa
  // É útil para reconstruir o objeto a partir de dados serializados, por exemplo, de um banco de dados ou JSON
  factory Barbeiro.fromMap(Map<String, dynamic> map) {
    return Barbeiro(
      idBarbeiro: map['idBarbeiro'], // Extrai o valor de 'idBarbeiro' do mapa e atribui a idBarbeiro
      idUsuario: map['idUsuario'],   // Extrai o valor de 'idUsuario' do mapa e atribui a idUsuario
    );
  }
} 