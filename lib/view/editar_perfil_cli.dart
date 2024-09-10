import 'package:flutter/material.dart';

class EditarPerfilPage extends StatefulWidget {
  @override
  _EditarPerfilPageState createState() => _EditarPerfilPageState();
}

class _EditarPerfilPageState extends State<EditarPerfilPage> {
  // Controladores dos campos de texto
  TextEditingController nomeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();

  // Exemplo de função para simular o carregamento de dados do perfil
  @override
  void initState() {
    super.initState();
    carregarDadosDoPerfil();
  }

  void carregarDadosDoPerfil() {
    // Simulação de dados, em uma aplicação real esses dados virão de uma API ou banco de dados
    setState(() {
      nomeController.text = "João Silva";
      emailController.text = "joao.silva@email.com";
      telefoneController.text = "(11) 99999-9999";
    });
  }

  // Função para salvar o perfil
  void salvarPerfil() {
    String nome = nomeController.text;
    String email = emailController.text;
    String telefone = telefoneController.text;

    // Aqui você pode implementar a lógica para salvar os dados (API, banco de dados, etc.)
    print("Perfil salvo: $nome, $email, $telefone");

    // Exibir uma mensagem de sucesso
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Perfil atualizado com sucesso!'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Perfil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: InputDecoration(
                labelText: 'Nome',
                border: OutlineInputBorder(),
              ),
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
              controller: telefoneController,
              decoration: InputDecoration(
                labelText: 'Telefone',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: salvarPerfil,
              child: Text('Salvar Alterações'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
