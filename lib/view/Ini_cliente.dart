import 'package:flutter/material.dart';

class IniCliente extends StatefulWidget {
  @override
  _IniClienteState createState() => _IniClienteState();
}

class _IniClienteState extends State<IniCliente> {
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
        backgroundColor: const Color.fromARGB(255, 255, 255, 255), // Roxo
      ),
      body: Container(
        color: const Color.fromARGB(255, 31, 31, 31), // Cor de fundo cinza claro
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Olá, João Victor!',
              style: TextStyle(fontSize: 24, color: const Color.fromARGB(255, 255, 255, 255)), // Roxo mais claro
            ),
            SizedBox(height: 16),
            Text(
              'Araguaína, Tocantins',
              style: TextStyle(fontSize: 16, color: const Color.fromARGB(255, 255, 255, 255)), // Roxo escuro
            ),
            SizedBox(height: 32),
            Text(
              'Cortes em Destaques',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 255, 255, 255)), // Roxo
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
                  imagePath: 'assets/cotes3.png', // Corrigido o caminho da imagem
                  likes: _likes3,
                  onTap: () => _incrementLikes(3),
                ),
              ],
            ),
            SizedBox(height: 32),
            Text(
              'Barbearias próximas',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 255, 255, 255)), // Roxo
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
        selectedItemColor: const Color.fromARGB(255, 0, 0, 0), // Roxo
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

class ImageWithLike extends StatefulWidget {
  final String imagePath;
  final int likes;
  final VoidCallback onTap;

  ImageWithLike({
    required this.imagePath,
    required this.likes,
    required this.onTap,
  });

  @override
  _ImageWithLikeState createState() => _ImageWithLikeState();
}

class _ImageWithLikeState extends State<ImageWithLike> {
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color.fromARGB(255, 75, 0, 130)), // Borda roxa
            image: DecorationImage(
              image: AssetImage(widget.imagePath),
              fit: BoxFit.cover,
            ),
          ),
          child: Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(
                _isLiked ? Icons.favorite : Icons.favorite_border,
                color: _isLiked ? Colors.red : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _isLiked = !_isLiked;
                  widget.onTap(); // Atualiza a contagem de curtidas
                });
              },
            ),
          ),
        ),
        SizedBox(height: 8),
        Text('${widget.likes}'),
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
      title: Text(
        name,
        style: TextStyle(color: Colors.white), // Cor branca para o nome
      ),
      subtitle: Text(
        address,
        style: TextStyle(color: Colors.white), // Cor branca para o endereço
      ),
      onTap: () {
        // Ação ao tocar no item da barbearia
      },
    );
  }
}
