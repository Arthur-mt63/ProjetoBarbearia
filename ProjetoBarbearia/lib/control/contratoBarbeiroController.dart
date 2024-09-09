import 'package:app/model/ContratoBarbeiro.dart';
import 'package:app/model/bancoDeDados.dart';

class Contratobarbeirocontroller {
  // start no banco de dados , criando um objeto dele;
  final Bancodedados bancodedados = Bancodedados();
  // estrutur para criar objeto.

  // medoto decadastro de usuario
  // Usuario é o nome da classe model.
  Future<int> addContrat(Contratobarbeiro contratobarbeiro) async {
    // criando uma variavel de banco de dados para salvar os dados

    final db = await bancodedados.database;

    // mandar os dados para o banco de dados
    return await db.insert('contratoBarbeiro', contratobarbeiro.toMap());
  }

  Future<int> deletarContratoBarbeiro(int id) async {
    // cria a variavel de banco de dados para acessar os metodos
    final db = await bancodedados.database;
    // excluir dantro do Banco de dados
    return await db.delete('use', where: 'id=?', whereArgs: [id]);
    // excluir o usuario dentro do banco de dados
  }

  // meotdo para eidtar o usuario
  Future<int> editarContratoBarbeiro(Contratobarbeiro contratobarbeiro) async {
    // criar variavel de banco de para acessar os metodos
    final db = await bancodedados.database;
    // atualizar os dados do usuario no banco de dados
    return await db.update('contratoBarbeiro', contratobarbeiro.toMap(),
        where: 'id=?', whereArgs: [contratobarbeiro.idContratoBarbeiro]);
  }

  Future<List<Contratobarbeiro>> getContratoBarbeiro() async {
    // criar variavel do banco de dados para usar os metodos
    final db = await bancodedados.database;
    // criar variavel para receber a lista de usuario do banco de dados
    final List<Map<String, dynamic>> listadebarbeiro =
        await db.query('contratoBarbeiro');
    /* variavel do tipo lista , que recebe um Map de Strings dinamicas 
    que recebe todos os dados da tsbela usuario do banco de dados*/
    return List.generate(listadebarbeiro.length, (int i) {
      return Contratobarbeiro.fromMap(listadebarbeiro[i]);
    });
  }
}