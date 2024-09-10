import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BarbeariasScreen(),
    );
  }
}

class BarbeariasScreen extends StatelessWidget {
  // Lista de barbearias
  final List<Map<String, String>> barbearias = [
    {'nome': 'Barbearia azevedo', 'preco': 'R\$45'},
    {'nome': 'Barbearia cardoso', 'preco': 'R\$20'},
    {'nome': 'Barbearia Dk', 'preco': 'R\$30'},
    {'nome': 'Barbearia Espírito Santo', 'preco': 'R\$25,00'},
    {'nome': 'Barbearia fio da navalha', 'preco': 'R\$35'},
    {'nome': 'Barbearia Soares', 'preco': 'R\$15,00'},
    {'nome': 'Barbearia Sr Manoel', 'preco': 'R\$100'},
    {'nome': 'Barbearia_b.sb', 'preco': 'R\$50'},
    {'nome': 'cruz black barber', 'preco': 'R\$10'},
    {'nome': 'Dhjorbarber', 'preco': 'R\$30'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Buscar barbearias',
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.search, color: Colors.yellow),
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(10),
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: barbearias.length,
        itemBuilder: (context, index) {
          final barbearia = barbearias[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey[800],
              child: Icon(Icons.store, color: Colors.white),
            ),
            title: Text(
              barbearia['nome']!,
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Row(
              children: [
                Text(
                  'Novo! ',
                  style: TextStyle(color: Colors.yellow, fontSize: 12),
                ),
                Icon(Icons.star, color: Colors.yellow, size: 16),
              ],
            ),
            trailing: Text(
              barbearia['preco']!,
              style: TextStyle(color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
