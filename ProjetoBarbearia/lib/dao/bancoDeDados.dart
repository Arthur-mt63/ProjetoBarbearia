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
    String path = join(await getDatabasesPath(), 'appBlack_database.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future _onCreate(Database db, int version) async {
    // Habilitar as chaves estrangeiras
    await db.execute('PRAGMA foreign_keys = ON');

    // Criação das tabelas
    await db.execute('''
CREATE TABLE Barbeiro (
    idBarbeiro  INTEGER PRIMARY KEY AUTOINCREMENT,
    nomeBarbeiro TEXT NOT NULL,
    fotoBarbeiro TEXT
);
    ''');

    await db.execute('''
CREATE TABLE Cliente (
    idCliente INTEGER PRIMARY KEY AUTOINCREMENT,
    nomeCli TEXT NOT NULL,
    cpf TEXT NOT NULL,
    dataNasc TEXT NOT NULL,
    usuario TEXT UNIQUE NOT NULL,
    emailCli TEXT NOT NULL,
    senhaCli TEXT NOT NULL,
    telefone TEXT
);
    ''');

    await db.execute('''
CREATE TABLE enderecoCli (
    idEnderecoCli INTEGER PRIMARY KEY AUTOINCREMENT,
    idCliente INTEGER NOT NULL,
    bairro TEXT NOT NULL,
    rua TEXT NOT NULL,
    cep TEXT NOT NULL,
    numero TEXT,
    complemento TEXT,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);
    ''');

    await db.execute('''
CREATE TABLE Barbearia (
    idBarbearia INTEGER PRIMARY KEY AUTOINCREMENT,
    NomeDono TEXT,
    nomeBarbearia TEXT UNIQUE NOT NULL,
    emaiBar TEXT NOT NULL,
    senhaBar TEXT NOT NULL
);
    ''');

    await db.execute('''
CREATE TABLE enderecoBar (
    idEnderecoBar INTEGER PRIMARY KEY AUTOINCREMENT,
    idBarbearia INTEGER NOT NULL,
    bairro TEXT NOT NULL,
    rua TEXT NOT NULL,
    cep TEXT NOT NULL,
    numero TEXT,
    complemento TEXT,
    FOREIGN KEY (idBarbearia) REFERENCES Barbearia(idBarbearia)
);
    ''');

    await db.execute('''
CREATE TABLE contratoBarbeiro (
    idContratoBarbeiro INTEGER PRIMARY KEY AUTOINCREMENT,
    idBarbeiro INTEGER NOT NULL,
    idBarbearia INTEGER NOT NULL,
    FOREIGN KEY (idBarbeiro) REFERENCES Barbeiro(idBarbeiro),
    FOREIGN KEY (idBarbearia) REFERENCES Barbearia(idBarbearia)
);
    ''');

    await db.execute('''
CREATE TABLE servicoBarbeiro (
    idServico INTEGER PRIMARY KEY AUTOINCREMENT,
    idBarbeiro INTEGER,
    nomeServico TEXT NOT NULL,
    foto TEXT,
    valor REAL NOT NULL,
    FOREIGN KEY (idBarbeiro) REFERENCES Barbeiro(idBarbeiro)
);
    ''');

    await db.execute('''
CREATE TABLE Loja (
    idLoja INTEGER PRIMARY KEY AUTOINCREMENT,
    idBarbearia INTEGER,
    FOREIGN KEY (idBarbearia) REFERENCES Barbearia(idBarbearia)
);
    ''');

    await db.execute('''
CREATE TABLE Produto (
    idProduto INTEGER PRIMARY KEY AUTOINCREMENT,
    nomeProduto TEXT NOT NULL,
    precoUnitario REAL NOT NULL,
    quantProduto INTEGER,
    descricaoProduto TEXT
);
    ''');

    await db.execute('''
CREATE TABLE ProdutoLoja (
    idProdutoLoja INTEGER PRIMARY KEY AUTOINCREMENT,
    idLoja INTEGER,
    FOREIGN KEY (idLoja) REFERENCES Loja(idLoja),
    idProduto INTEGER,
    FOREIGN KEY (idProduto) REFERENCES Produto(idProduto)
);
    ''');

    await db.execute('''
CREATE TABLE Venda (
    idVenda INTEGER PRIMARY KEY AUTOINCREMENT,
    idCliente INTEGER,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    dataVenda TEXT NOT NULL,
    horaVenda TEXT NOT NULL
);
    ''');

    await db.execute('''
CREATE TABLE ProdutoVenda (
    idProdutoVenda INTEGER PRIMARY KEY AUTOINCREMENT,
    idProduto INTEGER,
    FOREIGN KEY (idProduto) REFERENCES Produto(idProduto),
    idVenda INTEGER,
    FOREIGN KEY (idVenda) REFERENCES Venda(idVenda)
);
    ''');

    await db.execute('''
CREATE TABLE Agendamento (
    idAgendamento INTEGER PRIMARY KEY AUTOINCREMENT,
    idCliente INTEGER,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    dataAgen TEXT NOT NULL,
    valorTotal REAL NOT NULL
);
    ''');

    await db.execute('''
CREATE TABLE ServicoAgendamento (
    idServicoAgen INTEGER PRIMARY KEY AUTOINCREMENT,
    idServico INTEGER,
    FOREIGN KEY (idServico) REFERENCES servicoBarbeiro(idServico),
    idAgendamento INTEGER,
    FOREIGN KEY (idAgendamento) REFERENCES Agendamento(idAgendamento),
    dataServicoAgend TEXT NOT NULL,
    horaServico TEXT NOT NULL,
    valorServico REAL NOT NULL,
    avaliacao TEXT
);
    ''');
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // Código para atualizar o banco de dados de versões antigas para novas
  }
}
