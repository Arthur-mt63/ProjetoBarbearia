import 'package:flutter/material.dart';

class Menucliente extends StatefulWidget {
  @override
  _IniClienteState createState() => _IniClienteState();
}

class _IniClienteState extends State<Menucliente> {
  int _selectedIndex = 0;
  int _likes1 = 0;
  int _likes2 = 0;
  int _likes3 = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

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

  void _incrementLikes(int imageIndex) {
    setState(() {
      if (imageIndex == 1) {
        _likes1++;
      } else if (imageIndex == 2) {
        _likes2++;
      } else if (imageIndex == 3) {
        _likes3++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página do Cliente'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Olá, João Victor!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            Text(
              'Araguaína, Tocantins',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 32),
            Text(
              'Cortes em Destaques',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ImageWithLike(
                  imagePath: 'assets/cortes.png',
                  likes: _likes1,
                  onTap: () => _incrementLikes(1),
                ),
                ImageWithLike(
                  imagePath: 'assets/cortes2.png',
                  likes: _likes2,
                  onTap: () => _incrementLikes(2),
                ),
                ImageWithLike(
                  imagePath: 'assets/cotes3.png',
                  likes: _likes3,
                  onTap: () => _incrementLikes(3),
                ),
              ],
            ),
            SizedBox(height: 32),
            Text(
              'Barbearias próximas',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            BarberShopItem(
              name: 'Jacaré Barbearia',
              address: 'Rua Exemplo, 123',
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
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

class ImageWithLike extends StatelessWidget {
  final String imagePath;
  final int likes;
  final VoidCallback onTap;

  ImageWithLike({
    required this.imagePath,
    required this.likes,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imagePath,
          width: 100,
          height: 100,
        ),
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.favorite_border),
              onPressed: onTap,
            ),
            Text('$likes'),
          ],
        ),
      ],
    );
  }
}

class BarberShopItem extends StatelessWidget {
  final String name;
  final String address;

  BarberShopItem({required this.name, required this.address});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      subtitle: Text(address),
      onTap: () {
        // Ação ao tocar no item da barbearia
      },
    );
  }
}

// Tela de Agendar Barbearia (nova página)
class AgendarBarbeariaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agendar Barbearia'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text('Aqui você pode agendar um horário na barbearia'),
      ),
    );
  }
}