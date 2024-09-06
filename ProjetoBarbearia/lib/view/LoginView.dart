import 'package:flutter/material.dart';

class Loginview extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Loginview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1F1F1F), // Cor de fundo escura
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Ícone para adicionar uma foto do usuário
              GestureDetector(
                onTap: () {
                  // Ação ao clicar no ícone de foto (por exemplo, abrir galeria ou câmera)
                  // Implemente a lógica para selecionar ou capturar uma foto aqui
                },
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[800], // Cor de fundo do círculo
                  child: Icon(
                    Icons.camera_alt, // Ícone de câmera
                    size: 50, // Tamanho do ícone
                    color: Colors.white70, // Cor do ícone
                  ),
                ),
              ),
              SizedBox(height: 24), // Espaço entre o ícone e o campo de e-mail

              // Campo de E-mail
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFF2C2C2E),
                  labelText: 'E-Mail',
                  labelStyle: TextStyle(color: Colors.white70),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),

              // Campo de Senha
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFF2C2C2E),
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.white70),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: TextStyle(color: Colors.white),
                obscureText: true,
              ),
              SizedBox(height: 24),

              // Botão de Login
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Navegar para a tela inicial do cliente (IniCliente)
                    Navigator.pushReplacementNamed(context, '/Escolha');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF007AFF), // Cor azul para o botão
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    'LOG IN',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Links de "Esquecer Senha?" e "Cadastrar"
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context,
                          '/ResetPassword'); // Ação ao clicar em "Esquecer Senha?"
                    },
                    child: Text(
                      'Esquecer Senha?',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navegar para a tela de cadastro
                      Navigator.pushNamed(context, '/Escolha');
                    },
                    child: Text(
                      'Cadastrar',
                      style: TextStyle(color: Color(0xFF007AFF)),
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
