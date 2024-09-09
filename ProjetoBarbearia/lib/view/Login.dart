import 'package:app/view/Cadastro.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Definindo a chave do formulário
  final _formKey = GlobalKey<FormState>();

  // Variáveis de formulário
  final _emailUsuario = TextEditingController();
  final _senhaUsuario = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela de Login'),
        backgroundColor: const Color.fromARGB(255, 73, 200, 202),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0), // Margem de 16.0
        child: Form(
          key: _formKey, // Chave do formulário
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _emailUsuario,
                decoration: const InputDecoration(
                  hintText: 'Enter your email',
                ),
                validator: (String? value) {
                  // Expressão regular para validar um e-mail
                  String pattern = r'^[^@]+@[^@]+\.[^@]+';
                  RegExp regex = RegExp(pattern);

                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  } else if (!regex.hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _senhaUsuario,
                decoration: const InputDecoration(
                  hintText: 'Entre com sua Senha',
                ),
                obscureText: true,
                obscuringCharacter: '*',
                validator: (String? senha) {
                  if (senha == null || senha.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20), // Espaço entre os formulários
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Se o formulário for válido, execute a lógica de login
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CadastroState()),
                    );
                  }
                },
                child: Text('Entrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
