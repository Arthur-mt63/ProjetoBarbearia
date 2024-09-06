import 'package:flutter/material.dart';
import 'package:app/view/AdicionarProduto.dart';
import 'package:app/view/Financeiro_bar.dart';
import 'package:app/view/PerfilBarbeiro.dart';
import 'package:app/view/cria_post.dart';
import 'package:app/view/ultimos_agendamentos.dart';

class IniBarbeiro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jacare Barbearia',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Jacare Barbearia'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePageContent(), // Página principal
    AdicionarProduto(), // Tela de adicionar produto
    FinanceiroBar(), // Tela de financeiro
    PostScreen(), // Tela para criar post
    UltimosAgendamentosPage(), // Tela de últimos agendamentos
    PerfilBarbeiroPage(), // Tela de perfil do barbeiro
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Produto',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on),
            label: 'Financeiro',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.post_add),
            label: 'Criar Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Últimos Agendamentos',
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

class HomePageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: Colors.grey[900],
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                        'assets/barbearia.png'), // Adicione sua imagem aqui
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildDayButton(22, 'Qui'),
                    _buildDayButton(24, 'Sex'),
                    _buildDayButton(25, 'Sáb'),
                  ],
                ),
                SizedBox(height: 20),
                _buildAppointmentCard('Gabriel Nicolas', '09:00-10:00'),
                _buildAppointmentCard('Gustavo Nicolas', '10:00-11:00'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDayButton(int day, String weekday) {
    return ElevatedButton(
      onPressed: () {
        // Ação ao clicar no botão do dia
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
      ),
      child: Column(
        children: [
          Text(
            '$day',
            style: TextStyle(fontSize: 24),
          ),
          Text(weekday),
        ],
      ),
    );
  }

  Widget _buildAppointmentCard(String name, String time) {
    return Card(
      color: Colors.grey[800],
      child: ListTile(
        title: Text(
          name,
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          time,
          style: TextStyle(color: Colors.white70),
        ),
      ),
    );
  }
}
