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
    final path = join(dbPath, 'appBlack_database.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE Usuario (
      idUsuario INTEGER PRIMARY KEY AUTOINCREMENT,
      nome TEXT,
      cpf TEXT,
      dataNasc DATE,
      tipoUsuario TEXT,
      usuario TEXT,
      emailUsuario TEXT,
      senhaUsuario TEXT,
      bairro TEXT,
      cep TEXT,
      numero TEXT,
      complemento TEXT
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
      nomeBarbearia TEXT,
      bairro TEXT,
      cep TEXT,
      rua TEXT,
      numero TEXT,
      complemento TEXT,
      FOREIGN KEY (idBarbeiroPro) REFERENCES Barbeiro(idBarbeiro)
    )
  ''');

    await db.execute('''
    CREATE TABLE contratoBarbeiro (
      idContratoBarbeiro INTEGER PRIMARY KEY AUTOINCREMENT,
      idBarbeiro INTEGER,
      idBarbearia INTEGER,
      FOREIGN KEY (idBarbeiro) REFERENCES Barbeiro(idBarbeiro),
      FOREIGN KEY (idBarbearia) REFERENCES Barbearia(idBarbearia)
    )
  ''');

    await db.execute('''
    CREATE TABLE servicoBarbeiro (
      idServico INTEGER PRIMARY KEY AUTOINCREMENT,
      idBarbeiro INTEGER,
      nomeServico TEXT,
      foto TEXT,
      valor REAL,
      FOREIGN KEY (idBarbeiro) REFERENCES Barbeiro(idBarbeiro)
    )
  ''');

    await db.execute('''
    CREATE TABLE Repositorio (
      idRepositorio INTEGER PRIMARY KEY AUTOINCREMENT,
      idBarbeiro INTEGER NOT NULL,
      FOREIGN KEY (idBarbeiro) REFERENCES Barbeiro(idBarbeiro)
    )
  ''');

    await db.execute('''
    CREATE TABLE Post (
      idPost INTEGER PRIMARY KEY AUTOINCREMENT,
      idRepositorio INTEGER,
      imagemUrl TEXT,
      vidioUrl TEXT,
      descricaoPost TEXT,
      dataPost TEXT,
      FOREIGN KEY (idRepositorio) REFERENCES Repositorio(idRepositorio)
    )
  ''');

    await db.execute('''
    CREATE TABLE Loja (
      idLoja INTEGER PRIMARY KEY AUTOINCREMENT,
      idBarbearia INTEGER,
      FOREIGN KEY (idBarbearia) REFERENCES Barbearia(idBarbearia)
    )
  ''');

    await db.execute('''
    CREATE TABLE Produto (
      idProduto INTEGER PRIMARY KEY AUTOINCREMENT,
      nomeProduto TEXT,
      precoUnitario REAL,
      quantProduto INTEGER,
      descricaoProduto TEXT
    )
  ''');

    await db.execute('''
    CREATE TABLE ProdutoLoja (
      idProdutoLoja INTEGER PRIMARY KEY AUTOINCREMENT,
      idLoja INTEGER,
      idProduto INTEGER,
      FOREIGN KEY (idLoja) REFERENCES Loja(idLoja),
      FOREIGN KEY (idProduto) REFERENCES Produto(idProduto)
    )
  ''');

    await db.execute('''
    CREATE TABLE Venda (
      idVenda INTEGER PRIMARY KEY AUTOINCREMENT,
      idCliente INTEGER,
      dataVenda TEXT,
      horaVenda TEXT,
      FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
    )
  ''');

    await db.execute('''
    CREATE TABLE ProdutoVenda (
      idProdutoVenda INTEGER PRIMARY KEY AUTOINCREMENT,
      idProduto INTEGER,
      idVenda INTEGER,
      FOREIGN KEY (idProduto) REFERENCES Produto(idProduto),
      FOREIGN KEY (idVenda) REFERENCES Venda(idVenda)
    )
  ''');

    await db.execute('''
    CREATE TABLE Agendamento (
      idAgendamento INTEGER PRIMARY KEY AUTOINCREMENT,
      idCliente INTEGER,
      dataAgen TEXT,
      valorTotal REAL,
      FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
    )
  ''');

    await db.execute('''
    CREATE TABLE ServicoAgendamento (
      idServicoAgen INTEGER PRIMARY KEY AUTOINCREMENT,
      idServico INTEGER,
      idAgendamento INTEGER,
      dataServicoAgend TEXT,
      horaServico TEXT,
      valorServico REAL,
      avaliacao TEXT,
      FOREIGN KEY (idServico) REFERENCES servicoBarbeiro(idServico),
      FOREIGN KEY (idAgendamento) REFERENCES Agendamento(idAgendamento)
    )
  ''');
  }
}
