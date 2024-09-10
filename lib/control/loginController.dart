import 'package:app/dao/bancoDeDados.dart';
import 'package:app/model/cliente.dart';



class LoginController {
  //chamar meu banco
  final Bancodedados _bancodedados = Bancodedados();

  Future<Cliente?> fazerLogin(String usuarioEmail, String senha) async {
    try {

      final db = await _bancodedados.database;

      //listar os usuários
      final List<Map<String, dynamic>> lista = await db.query(
        'Cliente',
        where: 'emailCli =? AND senhaCli =?'  ,
        whereArgs: [usuarioEmail, senha],
      );

      if (lista.isNotEmpty) {
        return Cliente.fromMap(lista.first);
      } else {
        return null;
      }
    } catch (e) {
      print("erro no metodo $e");
      rethrow;
    }
    //statar meu banco
  }
}