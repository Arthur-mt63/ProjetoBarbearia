import 'package:app/model/BaseDeDados.dart';
import 'package:app/model/usuario.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';

class Logincontroller {
  // chamado o banco de dados
  final Bancodedados _bancodedados = Bancodedados();

  // meotodo de login com e-mail e senha.
  Future<Usuario?> loginWithEmailPassword(String email, String senha) async {
    // srtartar a variavel de banco de dado para usar os metodos
    final db = await _bancodedados.database;

    // listar os usuarios cadastrados no banco de dados
    final List<Map<String, dynamic>> lista = await db.query(
      'Usuario',
      where: 'emailUsuario =? AND senhaUsuario=?',
      whereArgs: [email, senha],
    ); // final da verificação de email e senha do banco de dados.
    if (lista.isNotEmpty) {
      return Usuario.fromMap(lista.first);
      // se a lista não for null , retorne os dados do usuario
    } else {
      return null;
      // se a lista for nula , retorne null .
    }
  } // FIM do metodo de autenticação com e-mail e senha
}
