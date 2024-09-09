// classe para listar , cadastrar e atualizar usuario

import 'package:app/model/bancoDeDados.dart';
import 'package:app/model/cliente.dart';


class  Clientecontroller {


//Start no banco de dados
//estrutura para criar objeto
final Bancodedados bancodedados =Bancodedados();


//metodo de cadastro de Barbearia
//User é o nome da classe model de voces
Future<int> addcliente(Cliente cliente)async{
  //criando uma variavel de banco de dados para salvar os dados

//mandar os dados para o banco de dados 
  final db =await bancodedados.database;

return await db.insert('Cliente',cliente.toMap());

}

// Método de excluir usuario

Future<int> deletarCliente(int id) async{
//  Cria a variavel de banco de dados para acessar os metodos

final db = await bancodedados.database;
// Excluir o usuario dentro do banco de dados

return await db.delete('Cliente', where: 'id=?' ,whereArgs: [id] );
// delete o registro dentro da tabela usuario, onde id do usuario for igual ao id do passado no metodo [deletarUsuario]


}

// Metodo para editar o usuario
// Usuario é a classe model
Future<int> editarCliente(Cliente cliente) async{


// criar variavel de banco de dados para acessar os metodos 
final db = await bancodedados.database;
// atualizar os dados do usuario no bancode dados
return await db.update('Cliente', cliente.toMap(), where:  'id= ?', whereArgs: [cliente.idCliente]);//atualiza dentro da tabela usuario onde oos dados do meus usuario onde for igual a minha tabela usuario

}

// metodo de listar usuário

Future<List<Cliente>> getCliente() async{
// criar vriavel do banco de dados pra usar os metodos
final db = await bancodedados.database;
// criar variavel para receber a lista dos usuario do banco de dados

final List<Map<String , dynamic>> listadeCliente= await db.query('Cliente');
// variavel do tipo lista, que recebe uma map de String dinamicas que recebe tods os dados da listas usuario do banco de dados
return List.generate(listadeCliente.length, (i){
  return Cliente.fromMap(listadeCliente[i]);
});

}
}//fim da classe UserController