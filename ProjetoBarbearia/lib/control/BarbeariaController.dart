import 'package:app/model/BaseDeDados.dart';
import 'package:app/model/Barbearia.dart';

class Barbeariacontroller {
  // start no banco de dados , criando um objeto dele;
  final Bancodedados bancodedados = Bancodedados();
  // estrutur para criar objeto.

  // medoto decadastro de usuario
  // Usuario é o nome da classe model.
  Future<int> addUser(Barbearia barbearia) async {
    // criando uma variavel de banco de dados para salvar os dados

    final db = await bancodedados.database;

    // mandar os dados para o banco de dados
    return await db.insert('Barbearia', barbearia.toMap());
  }

  Future<int> deletarUsuario(int id) async {
    // cria a variavel de banco de dados para acessar os metodos
    final db = await bancodedados.database;
    // excluir dantro do Banco de dados
    return await db.delete('use', where: 'id=?', whereArgs: [id]);
    // excluir o usuario dentro do banco de dados
  }

  // meotdo para eidtar o usuario
  Future<int> editarUsuario(Barbearia barbearia) async {
    // criar variavel de banco de para acessar os metodos
    final db = await bancodedados.database;
    // atualizar os dados do usuario no banco de dados
    return await db.update('Barbearia', barbearia.toMap(),
        where: 'id=?', whereArgs: [barbearia.idBarbearia]);
  }

  Future<List<Barbearia>> getBarbearia() async {
    // criar variavel do banco de dados para usar os metodos
    final db = await bancodedados.database;
    // criar variavel para receber a lista de usuario do banco de dados
    final List<Map<String, dynamic>> listadeusuario =
        await db.query('Barbearia');
    /* variavel do tipo lista , que recebe um Map de Strings dinamicas 
    que recebe todos os dados da tsbela usuario do banco de dados*/
    return List.generate(listadeusuario.length, (int i) {
      return Barbearia.fromMap(listadeusuario[i]);
    });
  }
}
