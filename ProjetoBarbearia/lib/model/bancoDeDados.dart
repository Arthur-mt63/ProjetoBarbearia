import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// Classe para gerenciar o banco de dados
class Bancodedados {
  // Cria uma instância única da classe Bancodedados (Singleton)
  static final Bancodedados _instance = Bancodedados._internal();

  // Factory constructor para retornar a instância única
  factory Bancodedados() => _instance;

  // Construtor interno privado para prevenir a criação de múltiplas instâncias
  Bancodedados._internal();

  // Referência ao banco de dados
  static Database? _database;

  // Getter para acessar o banco de dados
  // A palavra-chave async define que essa operação será assíncrona
  Future<Database> get database async {
    // Se o banco de dados já estiver inicializado, retorne-o
    if (_database != null) return _database!;

    // Caso contrário, inicialize o banco de dados
    _database = await _initDatabase() as Database?;
    return _database!;// retorna o banco de dados iniciado
  }

  // Método privado para inicializar o banco de dados
  Future<Database> _initDatabase() async {
    // Obter o caminho para armazenar o banco de dados
    String path = join(await getDatabasesPath(), 'appBlack_database.db');

    // Abrir o banco de dados
    return openDatabase(
      path, // Caminho do banco de dados
      version: 2, // Versão do banco de dados
      onCreate: _onCreate, // Função de callback para criação do banco de dados
     // onUpgrade: _onUpgrade, // Função de callback para atualização do banco de dados caso nao exista
    );
  }

  // Função para criar as tabelas do banco de dados
  Future _onCreate(Database db, int version) async {
    // Criar tabela Usuario
    //1° 
    await db.execute('''
      CREATE TABLE Usuario (
        idUsuario INTEGER PRIMARY KEY AUTOINCREMENT,
        nomeUsuario VARCHAR(50) NOT NULL,
        cpf VARCHAR(14) NOT NULL,
        dataNasc DATE NOT NULL,
        tipoUsuario VARCHAR(20) NOT NULL,
        usuario VARCHAR(10) UNIQUE NOT NULL,
        emailUsuario VARCHAR(100) NOT NULL,
        senhaUsuario VARCHAR(255) NOT NULL,
        telefone VARCHAR(15)
      )
    ''');

    // Criar tabela Barbeiro
    await db.execute('''
      CREATE TABLE Barbeiro (
        idBarbeiro INTEGER PRIMARY KEY AUTOINCREMENT,
        idUsuario INTEGER,
        FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
      )
    ''');

    // Criar tabela Cliente
    await db.execute('''
      CREATE TABLE Cliente (
        idCliente INTEGER PRIMARY KEY AUTOINCREMENT,
        idUsuarioCli INTEGER,
        FOREIGN KEY (idUsuarioCli) REFERENCES Usuario(idUsuario)
      )
    ''');

    // Criar tabela enderecoUsuario
    await db.execute('''
      CREATE TABLE enderecoUsuario (
        idEnderecoUsuario INTEGER PRIMARY KEY AUTOINCREMENT,
        idUsuario INTEGER,
        FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario),
        bairro VARCHAR(15) NOT NULL,
        cep VARCHAR(9) NOT NULL,
        numero VARCHAR(10),
        complemento VARCHAR(100)
      )
    ''');

    // Criar tabela Barbearia
    await db.execute('''
      CREATE TABLE Barbearia (
        idBarbearia INTEGER PRIMARY KEY AUTOINCREMENT,
        idBarbeiroPro INTEGER,
        FOREIGN KEY (idBarbeiroPro) REFERENCES Barbeiro(idBarbeiro) NOT NULL,
        nomeBarbearia VARCHAR(20) NOT NULL,
        bairro VARCHAR(15) NOT NULL,
        cep VARCHAR(9) NOT NULL,
        rua VARCHAR(20) NOT NULL,
        numero VARCHAR(10),
        complemento VARCHAR(100)
      )
    ''');

    // Criar tabela contratoBarbeiro
    await db.execute('''
      CREATE TABLE contratoBarbeiro (
        idContratoBarbeiro INTEGER PRIMARY KEY AUTOINCREMENT,
        idBarbeiro INTEGER,
        FOREIGN KEY (idBarbeiro) REFERENCES Barbeiro(idBarbeiro) NOT NULL,
        idBarbearia INTEGER,
        FOREIGN KEY (idBarbearia) REFERENCES Barbearia(idBarbearia) NOT NULL
      )
    ''');

    // Criar tabela servicoBarbeiro
    await db.execute('''
      CREATE TABLE servicoBarbeiro (
        idServico INTEGER PRIMARY KEY AUTOINCREMENT,
        idBarbeiro INTEGER,
        FOREIGN KEY (idBarbeiro) REFERENCES Barbeiro(idBarbeiro) NOT NULL,
        nomeServico VARCHAR(50) NOT NULL,
        foto VARCHAR(255),
        valor FLOAT NOT NULL
      )
    ''');

    // Criar tabela Repositorio
    await db.execute('''
      CREATE TABLE Repositorio (
        idRepositorio INTEGER PRIMARY KEY AUTOINCREMENT,
        idBarbeiro INTEGER,
        FOREIGN KEY (idBarbeiro) REFERENCES Barbeiro(idBarbeiro) NOT NULL
      )
    ''');

    // Criar tabela Post
    await db.execute('''
      CREATE TABLE Post (
        idPost INTEGER PRIMARY KEY AUTOINCREMENT,
        idRepositorio INTEGER,
        FOREIGN KEY (idRepositorio) REFERENCES Repositorio(idRepositorio) NOT NULL,
        imagemUrl VARCHAR(255),
        vidioUrl VARCHAR(255),
        descricaoPost VARCHAR(200),
        dataPost DATE NOT NULL
      )
    ''');

    // Criar tabela Loja
    await db.execute('''
      CREATE TABLE Loja (
        idLoja INTEGER PRIMARY KEY AUTOINCREMENT,
        idBarbearia INTEGER,
        FOREIGN KEY (idBarbearia) REFERENCES Barbearia(idBarbearia) NOT NULL
      )
    ''');

    // Criar tabela Produto
    await db.execute('''
      CREATE TABLE Produto (
        idProduto INTEGER PRIMARY KEY AUTOINCREMENT,
        nomeProduto VARCHAR(50) NOT NULL,
        precoUnitario FLOAT NOT NULL,
        quantProduto INTEGER,
        descricaoProduto VARCHAR(100)
      )
    ''');

    // Criar tabela ProdutoLoja
    await db.execute('''
      CREATE TABLE ProdutoLoja (
        idProdutoLoja INTEGER PRIMARY KEY AUTOINCREMENT,
        idLoja INTEGER,
        FOREIGN KEY (idLoja) REFERENCES Loja(idLoja) NOT NULL,
        idProduto INTEGER,
        FOREIGN KEY (idProduto) REFERENCES Produto(idProduto) NOT NULL
      )
    ''');

    // Criar tabela Venda
    await db.execute('''
      CREATE TABLE Venda (
        idVenda INTEGER PRIMARY KEY AUTOINCREMENT,
        idCliente INTEGER,
        FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente) NOT NULL,
        dataVenda DATE NOT NULL,
        horaVenda TIME NOT NULL
      )
    ''');

    // Criar tabela ProdutoVenda
    await db.execute('''
      CREATE TABLE ProdutoVenda (
        idProdutoVenda INTEGER PRIMARY KEY AUTOINCREMENT,
        idProduto INTEGER,
        FOREIGN KEY (idProduto) REFERENCES Produto(idProduto) NOT NULL,
        idVenda INTEGER,
        FOREIGN KEY (idVenda) REFERENCES Venda(idVenda) NOT NULL
      )
    ''');

    // Criar tabela Agendamento
    await db.execute('''
      CREATE TABLE Agendamento (
        idAgendamento INTEGER PRIMARY KEY AUTOINCREMENT,
        idCliente INTEGER,
        FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente) NOT NULL,
        dataAgen DATE NOT NULL,
        valorTotal FLOAT NOT NULL
      )
    ''');

    // Criar tabela ServicoAgendamento
    await db.execute('''
      CREATE TABLE ServicoAgendamento (
        idServicoAgen INTEGER PRIMARY KEY AUTOINCREMENT,
        idServico INTEGER,
        FOREIGN KEY (idServico) REFERENCES servicoBarbeiro(idServico) NOT NULL,
        idAgendamento INTEGER,
        FOREIGN KEY (idAgendamento) REFERENCES Agendamento(idAgendamento) NOT NULL,
        dataServicoAgend DATE NOT NULL,
        horaServico TIME NOT NULL,
        valorServico FLOAT NOT NULL,
        avaliacao VARCHAR(200)
      )
    ''');
  }

  // Função para atualizar o banco de dados para uma nova versão
  /*Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // Aqui, adicionar código para atualizar o banco de dados para novas versões
    //atualiza o banco de dados da versao 1 
    if(oldVersion < 2){// Se a vrsão antiga formenor que 2
    await db.execute(''' // Aqui que se adiciona as novas tabelas ...
      

''')}
  }*/
}