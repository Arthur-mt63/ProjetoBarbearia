import 'package:app/control/clienteController.dart';
import 'package:app/model/cliente.dart';

class Clientecontrol {
  // Tornar o método assíncrono e usar Future<Cliente?>
  static Future<Cliente?> verificarSeUsuarioExiste(String usuario) async {
    try {
      final Clientecontroller dao = Clientecontroller();
      // Chamar o método pesquisarUsuario e aguardar o resultado
      Cliente? cli = await dao.pesquisarUsuario(usuario);

      // Verificar se o usuário existe e retornar o cliente
      if (cli != null) {
        return cli;  // Retorna o cliente encontrado
      } else {
        return null;  // Retorna null se o usuário não for encontrado
      }
    } catch (e) {
      print("Erro ao verificar usuário: $e");
      rethrow; // Repropaga o erro
    }
  }


  static Future<Cliente?> verificarSeEmailExiste(String email) async {
    try{
      final Clientecontroller dao = Clientecontroller();
       Cliente? cli = await dao.pesquisarEmail(email);
      
      if (cli != null) {
        return cli;  // Retorna o cliente encontrado
      } else {
        return null;  // Retorna null se o usuário não for encontrado
      }
      
    }catch(e){
      print("Erro ao verificar email: $e");
      rethrow; // Repropaga o erro
    }
  }

  static Future<Cliente?> verificarSeCpfExiste(String cpf) async {
    try {
      final Clientecontroller dao = Clientecontroller();
      Cliente? cli = await dao.pesqCpf(cpf);

      if (cli != null) {
        return cli;  // Retorna o cliente encontrado
      } else {
        return null;  // Retorna null se o usuário não for encontrado
      }
    } catch (e) {
      print("Erro ao verificar Cpf: $e");
      rethrow; // Repropaga o erro
    }
  }
}
