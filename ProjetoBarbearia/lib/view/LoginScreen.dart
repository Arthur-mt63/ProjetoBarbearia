import 'package:app/view/Escolha.dart';
import 'package:app/view/Ini_cliente.dart';
import 'package:flutter/material.dart';
import 'package:app/view/Escolha.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Acesse sua conta',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 40),
              // Campo de email
              TextFormField(
                controller: emailController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[850],
                  prefixIcon: Icon(Icons.person, color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Campo de senha
              TextFormField(
                controller: passwordController,
                obscureText: true,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Senha',
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[850],
                  prefixIcon: Icon(Icons.lock, color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 10),
              // Campo Esqueci a Senha
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    // Navegar para a tela de recuperação de senha
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EsqueciSenhaScreen()),
                    );
                  },
                  child: Text(
                    'Esqueci a senha',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Navegar para a HomePage após login
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => IniCliente()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  disabledBackgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text('Login'),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EscolhaTela()),
                  );
                },
                child: Text(
                  'Não possui uma conta? Faça o seu cadastro',
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Tela de Recuperação de Senha
class EsqueciSenhaScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recuperar Senha'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Digite seu e-mail',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Simulação de envio do link de recuperação
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Link de recuperação enviado para o email!'),
                    backgroundColor: Colors.green,
                  ),
                );
                Navigator.pop(context); // Volta para a tela de login
              },
              child: Text('Enviar link de recuperação'),
            ),
          ],
        ),
      ),
    );
  }
}

// Tela Principal (HomePage)
