import 'package:flutter/material.dart';
import 'package:app/view/editar_perfil_bar.dart';

class PerfilBarbeiroPage extends StatefulWidget {
  @override
  _PerfilBarbeiroPageState createState() => _PerfilBarbeiroPageState();
}

class _PerfilBarbeiroPageState extends State<PerfilBarbeiroPage> {
  int _likes = 0;
  bool _isLiked = false;

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
      if (_isLiked) {
        _likes++;
      } else {
        _likes--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil do Barbeiro'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/barbeiro.png'),
              ),
              SizedBox(height: 20),
              Text(
                'Nome: Gabriel Nicolas',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'Telefone: (99) 99999-9999',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'E-mail: gabriel@barbearia.com',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Navega para a tela de edição de perfil
                      Navigator.pushNamed(context, '/editbar');
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          _isLiked ? Icons.favorite : Icons.favorite_border,
                          color: _isLiked ? Colors.red : Colors.black,
                        ),
                        SizedBox(width: 5),
                        Text('Editar Perfil'),
                        SizedBox(width: 5),
                        Text('$_likes'), // Mostra o número de curtidas
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditarPerfilBarbeiroPage()),
                      );
                      // Ação ao clicar em Excluir
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: Text('Excluir Conta'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
