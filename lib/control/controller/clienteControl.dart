
import 'package:app/dao/bancoDeDados.dart';
import 'package:app/model/cliente.dart';



class Clientecontroller {
  //start banco
  final Bancodedados bancodedados = Bancodedados();

  Future<int> salvaCli(Cliente u) async {
    try {
      final db = await Bancodedados().database; 
      return await db.insert('Cliente', u.toMap());
    } catch (e) {
      print('Erro ao acessar o banco de dados: $e');
      rethrow; // Opcional: relança a exceção para que possa ser tratada por quem chamou o método
    }
  }

  //deletar usuario
  Future<int> deletarCli(int id) async {
    final db = await bancodedados.database;

    return await db.delete('Cliente', where: 'idCliente = ?', whereArgs: [id]);
  }

  //editar usuario
  Future<int> editarUsuario(Cliente u) async {
    final db = await bancodedados.database;

    return await db.update('Cliente', u.toMap(),
        where: 'idUsuario = ?', whereArgs: [u.idCliente]);
  }

  //listar usuario
  Future<List<Cliente>> listarCliente() async {
    final db = await bancodedados.database;

    List<Map<String, dynamic>> listaUsuario = await db.query('Cliente');

    return List.generate(listaUsuario.length, (int i) {
      return Cliente.fromMap(listaUsuario[i]);
    });
  }

  //pesquisar por cpf
  Future<Cliente?> pesqCpf(String cpf) async {
    final db = await bancodedados.database;

    // Realizar a consulta para procurar o usuário pelo CPF
    final List<Map<String, dynamic>> resultado = await db.query(
      'Cliente',
      where: 'cpf = ?',
      whereArgs: [cpf],
    );

    if (resultado.isNotEmpty) {
      return Cliente.fromMap(resultado.first);
    } else {
      return null;
    }
  }

  // Realizar a consulta para procurar o usuário pelo usuario
  Future<Cliente?> pesquisarUsuario(String usuario) async{
    final db = await bancodedados.database;

     final List<Map<String, dynamic>> resultado = await db.query(
      'Cliente',
      where: 'usuario = ?',
      whereArgs: [usuario],
    );

    if (resultado.isNotEmpty) {
      return Cliente.fromMap(resultado.first);
    } else {
      return null;
    }

  }


    // Realizar a consulta para procurar o usuário pelo CPF
  Future<Cliente?> pesquisarEmail (String email) async{
    final db = await bancodedados.database;

     final List<Map<String, dynamic>> resultado = await db.query(
      'Cliente',
      where: 'emailCli = ?',
      whereArgs: [email],
    );

    if (resultado.isNotEmpty) {
      return Cliente.fromMap(resultado.first);
    } else {
      return null;
    }

  }
}