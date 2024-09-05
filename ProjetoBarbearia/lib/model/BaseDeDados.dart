import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Bancodedados {
  static final Bancodedados _instancia = Bancodedados._internal();
  factory Bancodedados() => _instancia;
  Bancodedados._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(await getDatabasesPath(), 'appBlack_database.db');

    return openDatabase(
      path,
      version: 2,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Usuario (
        idUsuario INTEGER PRIMARY KEY AUTOINCREMENT,
        nome VARCHAR(50) NOT NULL,
        cpf VARCHAR(14) NOT NULL,
        dataNasc DATE NOT NULL,
        tipoUsuario VARCHAR(20) NOT NULL,
        usuario VARCHAR(10) NOT NULL,
        emailUsuario VARCHAR(100) NOT NULL,
        senhaUsuario VARCHAR(255) NOT NULL,
        bairro VARCHAR(15) NOT NULL,
        cep VARCHAR(9) NOT NULL,
        numero VARCHAR(10),
        complemento VARCHAR(100)
      )
    ''');

    await db.execute('''
      CREATE TABLE Barbeiro (
        idBarbeiro INTEGER PRIMARY KEY AUTOINCREMENT,
        idUsuario INTEGER,
        FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
      )
    ''');

    await db.execute('''
      CREATE TABLE Cliente (
        idCliente INTEGER PRIMARY KEY AUTOINCREMENT,
        idUsuarioCli INTEGER,
        FOREIGN KEY (idUsuarioCli) REFERENCES Usuario(idUsuario)
      )
    ''');

    await db.execute('''
      CREATE TABLE Barbearia (
        idBarbearia INTEGER PRIMARY KEY AUTOINCREMENT,
        idBarbeiroPro INTEGER,
        FOREIGN KEY (idBarbeiroPro) REFERENCES Barbeiro(idBarbeiro),
        nomeBarbearia VARCHAR(20) NOT NULL,
        bairro VARCHAR(15) NOT NULL,
        cep VARCHAR(9) NOT NULL,
        rua VARCHAR(20) NOT NULL,
        numero VARCHAR(10),
        complemento VARCHAR(100)
      )
    ''');

    await db.execute('''
      CREATE TABLE contratoBarbeiro (
        idContratoBarbeiro INTEGER PRIMARY KEY AUTOINCREMENT,
        idBarbeiro INTEGER,
        FOREIGN KEY (idBarbeiro) REFERENCES Barbeiro(idBarbeiro) NOT NULL,
        idBarbearia INTEGER,
        FOREIGN KEY (idBarbearia) REFERENCES Barbearia(idBarbearia) NOT NULL
      ),
    ''');

    await db.execute('''
      CREATE TABLE servicoBarbeiro (
        idServico INTEGER PRIMARY KEY AUTOINCREMENT,
        idBarbeiro INTEGER,
        FOREIGN KEY (idBarbeiro) REFERENCES Barbeiro(idBarbeiro) NOT NULL,
        nomeServico VARCHAR(50) NOT NULL,
        foto VARCHAR(255),
        valor FLOAT NOT NULL
      ),
    ''');

    await db.execute('''
      CREATE TABLE Repositorio (
        idRepositorio INTEGER PRIMARY KEY AUTOINCREMENT,
        idBarbeiro INTEGER,
        FOREIGN KEY (idBarbeiro) REFERENCES Barbeiro(idBarbeiro) NOT NULL
      ),
    ''');

    await db.execute('''
      CREATE TABLE Post (
        idPost INTEGER PRIMARY KEY AUTOINCREMENT,
        idRepositorio INTEGER,
        FOREIGN KEY (idRepositorio) REFERENCES Repositorio(idRepositorio) NOT NULL,
        imagemUrl VARCHAR(255),
        vidioUrl VARCHAR(255),
        descricaoPost VARCHAR(200),
        dataPost DATE NOT NULL
      ),
    ''');

    await db.execute('''
      CREATE TABLE Loja (
        idLoja INTEGER PRIMARY KEY AUTOINCREMENT,
        idBarbearia INTEGER,
        FOREIGN KEY (idBarbearia) REFERENCES Barbearia(idBarbearia) NOT NULL
      ),
    ''');

    await db.execute('''
      CREATE TABLE Produto (
        idProduto INTEGER PRIMARY KEY AUTOINCREMENT,
        nomeProduto VARCHAR(50) NOT NULL,
        precoUnitario FLOAT NOT NULL,
        quantProduto INTEGER,
        descricaoProduto VARCHAR(100)
      ),
    ''');

    await db.execute('''
      CREATE TABLE ProdutoLoja (
        idProdutoLoja INTEGER PRIMARY KEY AUTOINCREMENT,
        idLoja INTEGER,
        FOREIGN KEY (idLoja) REFERENCES Loja(idLoja) NOT NULL,
        idProduto INTEGER,
        FOREIGN KEY (idProduto) REFERENCES Produto(idProduto) NOT NULL
      ),
    ''');

    await db.execute('''
      CREATE TABLE Venda (
        idVenda INTEGER PRIMARY KEY AUTOINCREMENT,
        idCliente INTEGER,
        FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente) NOT NULL,
        dataVenda DATE NOT NULL,
        horaVenda TIME NOT NULL
      ),
    ''');

    await db.execute('''
      CREATE TABLE ProdutoVenda (
        idProdutoVenda INTEGER PRIMARY KEY AUTOINCREMENT,
        idProduto INTEGER,
        FOREIGN KEY (idProduto) REFERENCES Produto(idProduto) NOT NULL,
        idVenda INTEGER,
        FOREIGN KEY (idVenda) REFERENCES Venda(idVenda) NOT NULL
      ),
    ''');

    await db.execute('''
      CREATE TABLE Agendamento (
        idAgendamento INTEGER PRIMARY KEY AUTOINCREMENT,
        idCliente INTEGER,
        FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente) NOT NULL,
        dataAgen DATE NOT NULL,
        valorTotal FLOAT NOT NULL
      ),
    ''');

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
      ),
    ''');
  }
}
