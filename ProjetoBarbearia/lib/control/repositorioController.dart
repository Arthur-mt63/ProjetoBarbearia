// classe para listar , cadastrar e atualizar usuario



import 'package:app/model/Repositorio.dart';
import 'package:app/model/bancoDeDados.dart';



class  Repositoriocontroller {


//Start no banco de dados
//estrutura para criar objeto
final Bancodedados bancodedados =Bancodedados();


//metodo de cadastro de Barbearia
//User é o nome da classe model de voces
Future<int> addRepositorio(Repositorio Repositorio)async{
  //criando uma variavel de banco de dados para salvar os dados

//mandar os dados para o banco de dados 
  final db =await bancodedados.database;

return await db.insert('Repositorio',Repositorio.toMap());

}

// Método de excluir usuario

Future<int> deletarRepositorio(int id) async{
//  Cria a variavel de banco de dados para acessar os metodos

final db = await bancodedados.database;
// Excluir o usuario dentro do banco de dados

return await db.delete('Repositorio', where: 'id=?' ,whereArgs: [id] );
// delete o registro dentro da tabela usuario, onde id do usuario for igual ao id do passado no metodo [deletarUsuario]


}

// Metodo para editar o usuario
// Usuario é a classe model
Future<int> editarRepositorio(Repositorio Repositorio) async{


// criar variavel de banco de dados para acessar os metodos 
final db = await bancodedados.database;
// atualizar os dados do usuario no bancode dados
return await db.update('Repositorio', Repositorio.toMap(), where:  'id= ?', whereArgs: [Repositorio.idRepositorio]);//atualiza dentro da tabela usuario onde oos dados do meus usuario onde for igual a minha tabela usuario

}

// metodo de listar usuário

Future<List<Repositorio>> getRepositorio() async{
// criar vriavel do banco de dados pra usar os metodos
final db = await bancodedados.database;
// criar variavel para receber a lista dos usuario do banco de dados

final List<Map<String , dynamic>> listadeRepositorio= await db.query('Repositorio');
// variavel do tipo lista, que recebe uma map de String dinamicas que recebe tods os dados da listas usuario do banco de dados
return List.generate(listadeRepositorio.length, (i){
  return Repositorio.fromMap(listadeRepositorio[i]);
});

}
}//fim da classe UserController