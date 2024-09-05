import 'package:flutter/material.dart';

class VerificationScreen extends StatefulWidget {
  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final TextEditingController _codeController = TextEditingController();
  bool _isButtonEnabled = false;

  void _checkCode(String value) {
    setState(() {
      _isButtonEnabled = value.length == 6; // Verifica se há 6 dígitos
    });
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            const Color.fromARGB(255, 249, 249, 249), // Cor da barra superior
        title: Text('Verificação de Código'),
        titleTextStyle:
            TextStyle(color: Colors.black), // Cor do texto do título
        iconTheme: IconThemeData(color: Colors.black), // Cor do ícone "voltar"
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Acabamos de enviar um código para seu e-mail',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Insira o código de verificação de 6 dígitos enviado para seu e-mail.',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _codeController,
              onChanged: _checkCode,
              keyboardType: TextInputType.number,
              maxLength: 6,
              decoration: InputDecoration(
                hintText: 'Código de 6 dígitos',
                border: OutlineInputBorder(),
                counterText: "", // Remove a exibição do contador de caracteres
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                _showMessage("Código reenviado com sucesso");
              },
              child: Text(
                'Reenviar código',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: _isButtonEnabled
                    ? () {
                        Navigator.pushNamed(context, '/CodigoDeRedef');
                        _showMessage("Código enviado com sucesso");
                        _codeController.clear(); // Limpa o campo de texto
                        setState(() {
                          _isButtonEnabled = false; // Desabilita o botão
                        });
                      }
                    : null, // Botão fica desabilitado até que 6 dígitos sejam preenchidos
                child: Text('Enviar'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50), // Largura do botão
                  backgroundColor: _isButtonEnabled
                      ? Colors.blue
                      : Colors.grey, // Cor baseada no estado
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Se não encontrar o e-mail na sua caixa de entrada, verifique a pasta de spam.',
                style: TextStyle(fontSize: 12, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
