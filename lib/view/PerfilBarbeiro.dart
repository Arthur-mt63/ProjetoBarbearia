import 'package:app/view/editar_perfil_bar.dart';
import 'package:flutter/material.dart';

class PerfilBarbeiroPage extends StatefulWidget {
  @override
  _PerfilBarbeiroPageState createState() => _PerfilBarbeiroPageState();
}

class _PerfilBarbeiroPageState extends State<PerfilBarbeiroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil do Barbeiro'),
        backgroundColor: Colors.black87,
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditarPerfilBarbeiroPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black87,
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    ),
                    child: Text(
                      'Editar Perfil',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Excluir Conta'),
                          content: Text('Você tem certeza que deseja excluir sua conta?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Cancelar'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                // Lógica para excluir a conta
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Conta excluída com sucesso')),
                                );
                              },
                              child: Text('Excluir'),
                            ),
                          ],
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    ),
                    child: Text(
                      'Excluir Conta',
                      style: TextStyle(color: Colors.white),
                    ),
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
