import 'package:flutter/material.dart';

class Perfil_clin extends StatefulWidget {
  @override
  _PerfilScreenState createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<Perfil_clin> {
  // Dados do usuário (exemplo)
  String _nome = 'João Victor';
  String _numero = '+55 123 456 789';
  String _email = 'joao.victor@example.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Ícone de perfil
              Icon(
                Icons.person,
                size: 100, // Tamanho do ícone
                color: Colors.blue, // Cor do ícone
              ),
              SizedBox(height: 16),

              // Informações do usuário
              Text(
                'Nome: $_nome',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Número: $_numero',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 8),
              Text(
                'E-mail: $_email',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 32),

              // Botões de ação
              ElevatedButton(
                onPressed: () {
                  // Lógica para editar conta
                  Navigator.pushNamed(context, '/editProfile');
                },
                child: Text('Editar Conta'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Lógica para excluir conta
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Confirmar Exclusão'),
                        content: Text('Você tem certeza que deseja excluir sua conta?'),
                        actions: <Widget>[
                          TextButton(
                            child: Text('Cancelar'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: Text('Excluir'),
                            onPressed: () {
                              // Adicione a lógica para excluir a conta aqui
                              Navigator.of(context).pop();
                              // Exemplo de navegação após exclusão
                              Navigator.pushReplacementNamed(context, '/login');
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Cor de fundo do botão
                ),
                child: Text('Excluir Conta'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3, // Define o índice do botão de navegação selecionado
        onTap: (index) {
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
        },
        backgroundColor: Colors.black, // Cor de fundo preta
        selectedItemColor: Colors.white, // Cor do item selecionado
        unselectedItemColor: Colors.grey, // Cor dos itens não selecionados
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
