import 'package:flutter/material.dart';

class PerfilBarbeiroPage extends StatelessWidget {
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
            mainAxisSize: MainAxisSize.min, // Ajusta a altura da coluna ao conteúdo
            crossAxisAlignment: CrossAxisAlignment.center, // Centraliza o conteúdo horizontalmente
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/barbeiro.png'), // Imagem do barbeiro
              ),
              SizedBox(height: 20),
              Text(
                'Nome: Gabriel Nicolas',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center, // Centraliza o texto
              ),
              SizedBox(height: 10),
              Text(
                'Telefone: (99) 99999-9999',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center, // Centraliza o texto
              ),
              SizedBox(height: 10),
              Text(
                'E-mail: gabriel@barbearia.com',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center, // Centraliza o texto
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // Centraliza os botões
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Ação ao clicar em Editar
                    },
                    child: Text('Editar Perfil'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
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
