import 'package:app/control/loginController.dart';
import 'package:app/model/cliente.dart';
import 'package:app/view/Cadastro.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // A função de login precisa ser async
  Future<void> _login() async {
    final email = _emailController.text;
    final senha = _passwordController.text;

    if (email.isNotEmpty && senha.isNotEmpty) {
      try {
        final LoginController _loginController = LoginController();
        Cliente? cli = await _loginController.fazerLogin(email, senha);

        if (cli != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => CadastroClienteScreen(), // Próxima tela
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Usuário ou Senha Incorreta!")
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Erro ao entrar; $e")),
        );
      }
    } else {
      // Exibir mensagem de erro caso os campos não estejam preenchidos
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, preencha todos os campos')),
      );
    }
  }

  void _signup() {
    Navigator.pushNamed(context, '/signup');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo do aplicativo
                SizedBox(
                  height: 80,
                  child: Image.asset('lib/imagens/logo_login.png'),
                ),
                SizedBox(height: 32.0),

                // Campo de email ou nome de usuário
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Email ou nome de usuário',
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 16.0),

                // Campo de senha
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Senha',
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 16.0),

                // Botão de login
                ElevatedButton(
                  onPressed: _login, // Chama diretamente a função _login
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    'Entrar',
                    style: TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                ),
                SizedBox(height: 16.0),

                // Divisor "OU"
                Row(
                  children: [
                    Expanded(child: Divider(thickness: 1)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'OU',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Expanded(child: Divider(thickness: 1)),
                  ],
                ),
                SizedBox(height: 16.0),

                // Botão de login com Google
                ElevatedButton.icon(
                  onPressed: () {
                    // Lógica para login com Google
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    backgroundColor: Colors.white,
                    side: BorderSide(color: Colors.grey),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  icon: Icon(
                    Icons.login,
                    color: Colors.red,
                  ),
                  label: Text(
                    'Entrar com Google',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(height: 16.0),

                // Link para "Esqueceu a senha?"
                GestureDetector(
                  onTap: () {
                    // Implementar a navegação para a tela de recuperação de senha
                  },
                  child: Text(
                    'Esqueceu a senha?',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14.0,
                    ),
                  ),
                ),
                SizedBox(height: 32.0),

                // Texto e botão de cadastro
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Não tem uma conta?',
                      style: TextStyle(fontSize: 14.0),
                    ),
                    SizedBox(width: 8.0),
                    GestureDetector(
                      onTap: _signup,
                      child: Text(
                        'Cadastre-se',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),

                // Footer
                Text(
                  'Desenvolvido por Carlos Zetti - 2024',
                  style: TextStyle(color: Colors.grey, fontSize: 12.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
