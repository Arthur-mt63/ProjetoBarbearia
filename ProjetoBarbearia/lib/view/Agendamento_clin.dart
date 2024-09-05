import 'package:flutter/material.dart';

class Agendamento_clin extends StatefulWidget {
  @override
  _AgendamentoScreenState createState() => _AgendamentoScreenState();
}

class _AgendamentoScreenState extends State<Agendamento_clin> {
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  String? _selectedBarberShop;
  String? _selectedBarber;

  final Map<String, List<String>> _barberShopBarbers = {
    'Jacaré Barbearia': ['Gabriel Nicollas', 'Gustavo Nicollas'],
    'Barbearia do Zé': ['João Oliveira', 'Luiz Fernando'],
    'Barbearia Elite': ['Pedro Santos', 'Renato Souza'],
  };

  List<String> _currentBarbers = [];

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  Future<void> _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime)
      setState(() {
        _selectedTime = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agendamento'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Seção de seleção de barbearia
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Selecione a Barbearia',
                border: OutlineInputBorder(),
              ),
              value: _selectedBarberShop,
              items: _barberShopBarbers.keys.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedBarberShop = newValue;
                  _currentBarbers = _barberShopBarbers[newValue!]!;
                  _selectedBarber = null; // Resetar barbeiro selecionado
                });
              },
            ),
            SizedBox(height: 16.0),

            // Seção de seleção de barbeiro
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Selecione o Barbeiro',
                border: OutlineInputBorder(),
              ),
              value: _selectedBarber,
              items: _currentBarbers.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedBarber = newValue;
                });
              },
            ),
            SizedBox(height: 16.0),

            // Seção de seleção de data
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Data:',
                  style: TextStyle(fontSize: 16),
                ),
                TextButton(
                  onPressed: _selectDate,
                  child: Text(
                    '${_selectedDate.toLocal()}'.split(' ')[0],
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),

            // Seção de seleção de horário
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hora:',
                  style: TextStyle(fontSize: 16),
                ),
                TextButton(
                  onPressed: _selectTime,
                  child: Text(
                    '${_selectedTime.format(context)}',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            SizedBox(height: 32.0),

            // Botão de confirmação
            ElevatedButton(
              onPressed: () {
                if (_selectedBarberShop == null || _selectedBarber == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Por favor, selecione uma barbearia e um barbeiro.'),
                    ),
                  );
                  return;
                }

                // Adicione a lógica para confirmar o agendamento aqui
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Agendamento Confirmado'),
                      content: Text(
                          'Seu agendamento foi realizado para ${_selectedDate.toLocal()} às ${_selectedTime.format(context)} com ${_selectedBarber!} na ${_selectedBarberShop!}.'),
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
              child: Text('Confirmar Agendamento'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2, // Define o índice do botão de navegação selecionado
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
