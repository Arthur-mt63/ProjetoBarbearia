class Post {
  int? idPost;
  int? idRepositorio;
  String? imagemUrl;
  String? vidioUrl;
  String? descricaoPost;
  int? dataPost;

  Post(
      {this.idPost,
      this.idRepositorio,
      this.imagemUrl,
      this.vidioUrl,
      this.descricaoPost,
      this.dataPost});

  Map<String, dynamic> toMap() {
    return {
      'idPost': idPost,
      'idRepositorio': idRepositorio,
      'imagemUrl': imagemUrl,
      'vidioUrl': vidioUrl,
      'descricaoPost': descricaoPost,
      'dataPost': dataPost,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      idPost: map['idPost'],
      idRepositorio: map['idRepositorio'],
      imagemUrl: map['imagemUrl'],
      vidioUrl: map['videoUrl'],
      descricaoPost: map['descricaoPost'],
      dataPost: map['dataPost'],
    );
  }
}
