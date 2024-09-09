import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Para usar SVGs se necessário para a logo
import 'package:google_sign_in/google_sign_in.dart'; // Para autenticação com o Google
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart'; // Para autenticação com o Facebook

// Função para autenticação com o Google
Future<void> _signInWithGoogle() async {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  try {
    await _googleSignIn.signIn();
  } catch (error) {
    print('Erro ao fazer login com o Google: $error');
  }
}

// Função para autenticação com o Facebook
Future<void> _signInWithFacebook() async {
  try {
    final LoginResult result = await FacebookAuth.instance.login();
    
    if (result.status == LoginStatus.success) {
      // Usuário autenticado com sucesso
      print('Usuário autenticado com Facebook: ${result.accessToken}');
    } else {
      print('Erro ao fazer login com o Facebook: ${result.message}');
    }
  } catch (error) {
    print('Erro ao fazer login com o Facebook: $error');
  }
}

class Layout extends StatefulWidget {
  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    if (_formKey.currentState?.validate() ?? false) {
      final email = _emailController.text;
      final password = _passwordController.text;

      // Lógica de autenticação aqui
      print('Email: $email, Password: $password');
    }
  }

  void _forgotPassword() {
    // Lógica de recuperação de senha aqui
    print('Esqueceu a senha');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            // SvgPicture.asset('assets/logo.svg', height: 40), // Exemplo de logo em SVG
            SizedBox(width: 10),
            Text('Barbearia Navalha'),
          ],
        ),
        backgroundColor: Color.fromARGB(86, 5, 226, 19), // Cor laranja chamativa
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Row(
               crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
               Image.asset('assets/teste.png',height: 200), //adicionando imagens no app barbearia
                 ],
             ),
             SizedBox(height: 16.0),
               TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu email';
                  }
                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    return 'Insira um email válido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
                obscuringCharacter: '*',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira sua senha';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: _forgotPassword,
                  child: Text(
                    'Esqueceu a senha?',
                    style: TextStyle(color: Color.fromARGB(255, 255, 87, 34)), // Cor laranja chamativa
                  ),
                ),
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 255, 87, 34), // Cor laranja chamativa
                  padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                  textStyle: TextStyle(fontSize: 16),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _signInWithGoogle,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Cor azul para Google
                      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                      textStyle: TextStyle(fontSize: 14),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.alternate_email, color: Colors.white), // Ícone do Google
                        SizedBox(width: 8.0),
                        Text(
                          'Google',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16.0),
                  ElevatedButton(
                    onPressed: _signInWithFacebook,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 59, 89, 152), // Cor azul para Facebook
                      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                      textStyle: TextStyle(fontSize: 14),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.facebook, color: Colors.white), // Ícone do Facebook
                        SizedBox(width: 8.0),
                        Text(
                          'Facebook',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
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
