import 'package:app/dao/bancoDeDados.dart';
import 'package:app/model/cliente.dart';
import 'package:sqflite/sqflite.dart';

class LoginController {
  //chamar meu banco
  final Bancodedados _bancodedados = Bancodedados();

  Future<Cliente?> fazerLogin(String email, String senha) async {
    //statar meu banco
    final db = await _bancodedados.database;

    //listar os usuários
    final List<Map<String, dynamic>> lista = await db.query(
      'Usuarios',
      where: 'emailUsuario =? AND senha =?',
      whereArgs: [email, senha],
    );

    if (lista.isEmpty) {
      return Cliente.fromMap(lista.first);
    } else {
      return null;
    }
  }
}
