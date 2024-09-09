import 'package:app/model/ProdutoVenda.dart';
import 'package:app/model/BaseDeDados.dart';

class Produtovendacontroller {
  // start no banco de dados , criando um objeto dele;
  final Bancodedados bancodedados = Bancodedados();
  // estrutur para criar objeto.

  // medoto decadastro de usuario
  // Usuario é o nome da classe model.
  Future<int> addUser(ProdutoVenda produtovenda) async {
    // criando uma variavel de banco de dados para salvar os dados

    final db = await bancodedados.database;

    // mandar os dados para o banco de dados
    return await db.insert('ProdutoVenda', produtovenda.toMap());
  }

  Future<int> deletarUsuario(int id) async {
    // cria a variavel de banco de dados para acessar os metodos
    final db = await bancodedados.database;
    // excluir dantro do Banco de dados
    return await db.delete('use', where: 'id=?', whereArgs: [id]);
    // excluir o usuario dentro do banco de dados
  }

  // meotdo para eidtar o usuario
  Future<int> editarUsuario(ProdutoVenda produtovenda) async {
    // criar variavel de banco de para acessar os metodos
    final db = await bancodedados.database;
    // atualizar os dados do usuario no banco de dados
    return await db.update('ProdutoVenda', produtovenda.toMap(),
        where: 'id=?', whereArgs: [produtovenda.idProdutoVenda]);
  }

  Future<List<ProdutoVenda>> getProdutoVenda() async {
    // criar variavel do banco de dados para usar os metodos
    final db = await bancodedados.database;
    // criar variavel para receber a lista de usuario do banco de dados
    final List<Map<String, dynamic>> listadeusuario =
        await db.query('ProdutoVenda');
    /* variavel do tipo lista , que recebe um Map de Strings dinamicas 
    que recebe todos os dados da tsbela usuario do banco de dados*/
    return List.generate(listadeusuario.length, (int i) {
      return ProdutoVenda.fromMap(listadeusuario[i]);
    });
  }
}
