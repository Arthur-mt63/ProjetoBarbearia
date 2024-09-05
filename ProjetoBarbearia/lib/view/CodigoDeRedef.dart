import 'package:flutter/material.dart';

class CodigoDeRedef extends StatefulWidget {
  @override
  _CodigoDeRedefState createState() => _CodigoDeRedefState();
}

class _CodigoDeRedefState extends State<CodigoDeRedef> {
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _confirmarSenhaController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isButtonEnabled = false;
  bool _senhaVisivel = false;
  bool _confirmarSenhaVisivel = false;

  @override
  void initState() {
    super.initState();
    _senhaController.addListener(_validateInput);
    _confirmarSenhaController.addListener(_validateInput);
  }

  void _validateInput() {
    setState(() {
      _isButtonEnabled = _senhaController.text.isNotEmpty &&
          _confirmarSenhaController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _senhaController.dispose();
    _confirmarSenhaController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // Implementar a funcionalidade de redefinição de senha aqui
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Senha redefinida com sucesso!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Criar uma senha nova?',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 40),

                // Campo Senha Nova
                TextFormField(
                  controller: _senhaController,
                  obscureText: !_senhaVisivel,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[300],
                    hintText: 'Senha nova',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _senhaVisivel ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _senhaVisivel = !_senhaVisivel;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'É necessário preencher este campo';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                // Campo Confirmar Senha
                TextFormField(
                  controller: _confirmarSenhaController,
                  obscureText: !_confirmarSenhaVisivel,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[300],
                    hintText: 'Reinsira a senha nova',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _confirmarSenhaVisivel
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _confirmarSenhaVisivel = !_confirmarSenhaVisivel;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'É necessário preencher este campo';
                    }
                    if (value != _senhaController.text) {
                      return 'As senhas não coincidem';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                // Checkbox para nova senha
                Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (bool? value) {
                        // Implementar funcionalidade de checkbox aqui
                      },
                    ),
                    Flexible(
                      child: Text(
                        'É necessário que todos os dispositivos acessem sua conta com a nova senha',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // Botão Redefinir Senha
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey, // Background color
                    disabledBackgroundColor: Colors.white, // Text color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 15),
                    minimumSize: Size(double.infinity, 0),
                  ),
                  child: Text(
                    'Redefinir Senha',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
