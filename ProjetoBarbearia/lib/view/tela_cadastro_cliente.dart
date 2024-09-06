import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:app/view/Ini_cliente.dart'; // Para formatar a data de nascimento

class CadastroClientePage extends StatefulWidget {
  @override
  _CadastroClientePageState createState() => _CadastroClientePageState();
}

class _CadastroClientePageState extends State<CadastroClientePage> {
  // Controladores dos campos de texto
  TextEditingController nomeController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController dataNascimentoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();

  // Função para cadastrar o cliente
  void cadastrarCliente() {
    String nome = nomeController.text;
    String cpf = cpfController.text;
    String dataNascimento = dataNascimentoController.text;
    String email = emailController.text;
    String senha = senhaController.text;
    String telefone = telefoneController.text;

    // Aqui você pode implementar a lógica para salvar os dados (API, banco de dados, etc.)
    print(
        "Cliente cadastrado: $nome, $cpf, $dataNascimento, $email, $senha, $telefone");

    // Exibir uma mensagem de sucesso
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Cliente cadastrado com sucesso!'),
    ));
  }

  // Função para selecionar a data de nascimento
  Future<void> _selecionarDataNascimento(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        dataNascimentoController.text =
            DateFormat('dd/MM/yyyy').format(pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Cliente'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: nomeController,
                decoration: InputDecoration(
                  labelText: 'Nome Completo',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: cpfController,
                decoration: InputDecoration(
                  labelText: 'CPF',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              TextField(
                controller: dataNascimentoController,
                decoration: InputDecoration(
                  labelText: 'Data de Nascimento',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () => _selecionarDataNascimento(context),
                  ),
                ),
                readOnly: true,
              ),
              SizedBox(height: 16),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),
              TextField(
                controller: senhaController,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              SizedBox(height: 16),
              TextField(
                controller: telefoneController,
                decoration: InputDecoration(
                  labelText: 'Telefone',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  // Navegar para a HomePage (tela principal) após login
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => IniCliente()),
                  );
                },
                child: Text('Cadastrar Cliente'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
