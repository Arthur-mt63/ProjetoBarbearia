import 'package:flutter/material.dart';

class Produtoclin extends StatefulWidget {
  @override
  _ProdutoclinState createState() => _ProdutoclinState();
}

class _ProdutoclinState extends State<Produtoclin> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _allProducts = [
    'Pomada para cabelo',
    'Shampoo de barba',
    'Óleo para barba',
    'Cera para cabelo',
    'Pente para barba',
  ];
  List<String> _filteredProducts = [];

  @override
  void initState() {
    super.initState();
    _filteredProducts = _allProducts;
  }

  void _filterProducts(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredProducts = _allProducts;
      } else {
        _filteredProducts = _allProducts
            .where((product) => product.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _onBottomNavBarTapped(int index) {
    // Handle bottom navigation bar taps here
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/products');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/schedule');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pesquisa de Produtos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Pesquisar produtos',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: _filterProducts,
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredProducts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_filteredProducts[index]),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Produto Selecionado'),
                            content: Text('Você selecionou: ${_filteredProducts[index]}'),
                            actions: <Widget>[
                              TextButton(
                                child: Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // Define o índice do botão de navegação selecionado
        onTap: _onBottomNavBarTapped,
        backgroundColor: Colors.black, // Cor de fundo preta
        selectedItemColor: const Color.fromARGB(255, 90, 90, 90), // Cor do item selecionado
        unselectedItemColor: const Color.fromARGB(255, 0, 0, 0), // Cor dos itens não selecionados
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Produto',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: 'Agendamento',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
