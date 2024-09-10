// classe para listar, cadastrar e atualizar usuários

import 'package:app/model/BaseDeDados.dart';
import 'package:app/model/usuario.dart';

class Usercontroller {
  // Instanciando o banco de dados
  final Bancodedados bancodedados = Bancodedados();

  // Método para cadastro de usuário
  Future<int> addUser(Usuario usuario) async {
    // Acessa o banco de dados
    final db = await bancodedados.database;

    // Insere os dados do usuário na tabela 'Usuario' e retorna o ID inserido
    return await db.insert('Usuario', usuario.toMap());
  }

  // Método para deletar usuário
  Future<int> deletarUsuario(int id) async {
    // Acessa o banco de dados
    final db = await bancodedados.database;

    // Deleta o usuário na tabela 'Usuario' onde o ID coincide
    return await db.delete('Usuario', where: 'id=?', whereArgs: [id]);
  }

  // Método para editar usuário
  Future<int> editarUsuario(Usuario usuario) async {
    // Acessa o banco de dados
    final db = await bancodedados.database;

    // Atualiza os dados do usuário na tabela 'Usuario' onde o ID coincide
    return await db.update('Usuario', usuario.toMap(),
        where: 'id=?', whereArgs: [usuario.idUsuario]);
  }

  // Método para obter a lista de usuários
  Future<List<Usuario>> getUser() async {
    // Acessa o banco de dados
    final db = await bancodedados.database;

    // Executa uma consulta na tabela 'Usuario'
    final List<Map<String, dynamic>> listadeusuario = await db.query('Usuario');

    // Converte a lista de mapas em uma lista de objetos Usuario
    return List.generate(listadeusuario.length, (int i) {
      return Usuario.fromMap(listadeusuario[i]);
    });
  }
}
