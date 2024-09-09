class Post {
  // Declaração de variáveis de instância que podem ser nulas
  int? idPost; // Identificador único do post
  int? idRepositorio; // Identificador do repositório ao qual o post está associado
  String? imagemUrl; // URL da imagem associada ao post
  String? videoUrl; // URL do vídeo associado ao post
  String? descricaoPost; // Descrição do post
  int? dataPost; // Data do post, representada como um inteiro (por exemplo, timestamp)

  // Construtor da classe Post
  // Permite inicializar uma instância da classe com valores para todos os atributos
  Post({
    this.idPost,
    this.idRepositorio,
    this.imagemUrl,
    this.videoUrl,
    this.descricaoPost,
    this.dataPost,
  });

  // Método que converte o objeto Post em um Map
  // Útil para serializar o objeto, por exemplo, ao salvar em um banco de dados ou enviar via API
  Map<String, dynamic> toMap() {
    return {
      'idPost': idPost, // Atribui o valor de idPost à chave 'idPost' no mapa
      'idRepositorio': idRepositorio, // Atribui o valor de idRepositorio à chave 'idRepositorio' no mapa
      'imagemUrl': imagemUrl, // Atribui o valor de imagemUrl à chave 'imagemUrl' no mapa
      'videoUrl': videoUrl, // Atribui o valor de videoUrl à chave 'videoUrl' no mapa
      'descricaoPost': descricaoPost, // Atribui o valor de descricaoPost à chave 'descricaoPost' no mapa
      'dataPost': dataPost, // Atribui o valor de dataPost à chave 'dataPost' no mapa
    };
  }

  // Factory constructor que cria um objeto Post a partir de um Map
  // Útil para criar uma instância da classe usando dados armazenados em formato de mapa
  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      idPost: map['idPost'], // Extrai o valor de 'idPost' do mapa e atribui a idPost
      idRepositorio: map['idRepositorio'], // Extrai o valor de 'idRepositorio' do mapa e atribui a idRepositorio
      imagemUrl: map['imagemUrl'], // Extrai o valor de 'imagemUrl' do mapa e atribui a imagemUrl
      videoUrl: map['videoUrl'], // Extrai o valor de 'videoUrl' do mapa e atribui a videoUrl
      descricaoPost: map['descricaoPost'], // Extrai o valor de 'descricaoPost' do mapa e atribui a descricaoPost
      dataPost: map['dataPost'], // Extrai o valor de 'dataPost' do mapa e atribui a dataPost
    );
  }
}
