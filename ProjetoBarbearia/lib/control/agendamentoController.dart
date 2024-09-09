// classe para listar , cadastrar e atualizar usuario

import 'package:app/model/Agendamento.dart';
import 'package:app/model/bancoDeDados.dart';

class Agendamentocontroller {


//Start no banco de dados
//estrutura para criar objeto
final Bancodedados bancodedados =Bancodedados();


//metodo de cadastro de usuario
//User é o nome da classe model de voces
Future<int> addAgenda(Agendamento agendamento)async{
  //criando uma variavel de banco de dados para salvar os dados

//mandar os dados para o banco de dados 
  final db =await bancodedados.database;

return await db.insert('Agendamento',agendamento.toMap());

}

// Método de excluir usuario

Future<int> deletarAgendamento(int id) async{
//  Cria a variavel de banco de dados para acessar os metodos

final db = await bancodedados.database;
// Excluir o usuario dentro do banco de dados

return await db.delete('Agendamento', where: 'id=?' ,whereArgs: [id] );
// delete o registro dentro da tabela usuario, onde id do usuario for igual ao id do passado no metodo [deletarUsuario]


}

// Metodo para editar o usuario
// Usuario é a classe model
Future<int> editarAgendamento(Agendamento agendamento) async{


// criar variavel de banco de dados para acessar os metodos 
final db = await bancodedados.database;
// atualizar os dados do usuario no bancode dados
return await db.update('Agendamento', agendamento.toMap(), where:  'id= ?', whereArgs: [agendamento.idAgendamento]);//atualiza dentro da tabela usuario onde oos dados do meus usuario onde for igual a minha tabela usuario

}

// metodo de listar usuário

Future<List<Agendamento>> getAgenda() async{
// criar vriavel do banco de dados pra usar os metodos
final db = await bancodedados.database;
// criar variavel para receber a lista dos usuario do banco de dados

final List<Map<String , dynamic>> listadeagendamento= await db.query('Agendamento');
// variavel do tipo lista, que recebe uma map de String dinamicas que recebe tods os dados da listas usuario do banco de dados
return List.generate(listadeagendamento.length, (i){
  return Agendamento.fromMap(listadeagendamento[i]);
});

}
}//fim da classe UserController
