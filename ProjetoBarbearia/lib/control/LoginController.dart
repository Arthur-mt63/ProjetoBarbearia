import 'package:app/model/bancoDeDados.dart';
import 'package:app/model/usuario.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';


// classe para realizar login com o ususario
class Logincontroller {

//  chamando o banco de dados
final Bancodedados _bancodedados = Bancodedados();

// metotdo de autenticacao com e-mail e senha
Future<Usuario?> loginwhithEmailPassword (String email, String senha)async{
// startar a variavel de banco de dados para usaros metodos
final db = await _bancodedados.database;

// listar os usuarios cadastrados no banco de dados
final List<Map<String, dynamic>> lista = await db.query(
  'Usuario', where: 'emailUsuario =? AND senhaUsuario=?', whereArgs: [email,senha],
);

if(lista.isNotEmpty){
  return Usuario.fromMap(lista.first);
  //se lista nao for nula , retorne os dados do usuario
}else{
  return null;
  // se lista for nula, retorne null.
}
}

}//fim do metodo de autenticacao com e-mail e senha