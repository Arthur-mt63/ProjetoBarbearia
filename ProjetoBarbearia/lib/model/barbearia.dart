class Barbearia {
  // Declaração de variáveis de instância que podem ser nulas
  int? idBarbearia; // Identificador único da barbearia
  int? proprietario; // Identificador do proprietário da barbearia
  String? nomeBarbearia; // Nome da barbearia
  String? bairro; // Bairro onde a barbearia está localizada
  int? cep; // Código postal (CEP) da localização da barbearia
  String? rua; // Nome da rua da barbearia
  int? numero; // Número do endereço da barbearia
  String? complemento; // Complemento do endereço (ex: sala, andar)

  // Construtor - inicialização da classe Barbearia
  // Permite criar uma instância da classe com valores para cada atributo
  Barbearia({
    this.idBarbearia,
    this.proprietario,
    this.nomeBarbearia,
    this.bairro,
    this.cep,
    this.rua,
    this.numero,
    this.complemento,
  });

  // Método para converter o objeto Barbearia em um Map
  // Útil para serializar o objeto, por exemplo, ao salvar em um banco de dados ou enviar via API
  Map<String, dynamic> toMap() {
    return {
      'idBarbearia': idBarbearia, // Chave 'idBarbearia' mapeada para o valor de idBarbearia
      'proprietario': proprietario, // Chave 'proprietario' mapeada para o valor de proprietario
      'nomeBarbearia': nomeBarbearia, // Chave 'nomeBarbearia' mapeada para o valor de nomeBarbearia
      'bairro': bairro, // Chave 'bairro' mapeada para o valor de bairro
      'cep': cep, // Chave 'cep' mapeada para o valor de cep
      'rua': rua, // Chave 'rua' mapeada para o valor de rua
      'numero': numero, // Chave 'numero' mapeada para o valor de numero
      'complemento': complemento, // Chave 'complemento' mapeada para o valor de complemento
    };
  }

  // Factory para criar uma instância de Barbearia a partir de um Map
  // Útil para desserializar dados, reconstruindo o objeto a partir de dados armazenados ou recebidos
  factory Barbearia.fromMap(Map<String, dynamic> map) {
    return Barbearia(
      idBarbearia: map['idBarbearia'], // Atribui o valor de 'idBarbearia' do mapa a idBarbearia
      proprietario: map['proprietario'], // Atribui o valor de 'proprietario' do mapa a proprietario
      nomeBarbearia: map['nomeBarbearia'], // Atribui o valor de 'nomeBarbearia' do mapa a nomeBarbearia
      bairro: map['bairro'], // Atribui o valor de 'bairro' do mapa a bairro
      cep: map['cep'], // Atribui o valor de 'cep' do mapa a cep
      rua: map['rua'], // Atribui o valor de 'rua' do mapa a rua
      numero: map['numero'], // Atribui o valor de 'numero' do mapa a numero
      complemento: map['complemento'], // Atribui o valor de 'complemento' do mapa a complemento
    );
  }
}
