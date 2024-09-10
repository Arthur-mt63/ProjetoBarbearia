import 'package:flutter/material.dart';

class AdicionarProduto extends StatefulWidget {
  @override
  _AdicionarProdutoState createState() => _AdicionarProdutoState();
}

class _AdicionarProdutoState extends State<AdicionarProduto> {
  final TextEditingController _nomeProdutoController = TextEditingController();
  final TextEditingController _precoProdutoController = TextEditingController();
  final TextEditingController _descricaoProdutoController = TextEditingController();

  void _salvarProduto() {
    String nome = _nomeProdutoController.text;
    String preco = _precoProdutoController.text;
    String descricao = _descricaoProdutoController.text;

    // Aqui você pode adicionar a lógica para salvar os dados do produto
    print('Produto Salvo: Nome: $nome, Preço: $preco, Descrição: $descricao');

    // Limpar os campos após salvar
    _nomeProdutoController.clear();
    _precoProdutoController.clear();
    _descricaoProdutoController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Produto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomeProdutoController,
              decoration: InputDecoration(labelText: 'Nome do Produto'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _precoProdutoController,
              decoration: InputDecoration(labelText: 'Preço'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _descricaoProdutoController,
              decoration: InputDecoration(labelText: 'Descrição'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _salvarProduto,
              child: Text('Salvar Produto'),
            ),
          ],
        ),
      ),
    );
  }
}
