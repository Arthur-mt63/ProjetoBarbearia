import 'package:app/view/Ini_Barbeiro.dart';
import 'package:flutter/material.dart';


class CadastroBarbeiroPage extends StatefulWidget {
  @override
  _CadastroBarbeiroPageState createState() => _CadastroBarbeiroPageState();
}

class _CadastroBarbeiroPageState extends State<CadastroBarbeiroPage> {
  // Controladores dos campos de texto
  TextEditingController nomeDonoController = TextEditingController();
  TextEditingController gmailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  
  // Lista de barbeiros
  List<TextEditingController> barbeirosControllers = [];

  // Função para cadastrar o barbeiro
  void cadastrarBarbeiro() {
    String nomeDono = nomeDonoController.text;
    String gmail = gmailController.text;
    String senha = senhaController.text;
    List<String> nomesBarbeiros = barbeirosControllers.map((controller) => controller.text).toList();

    // Lógica para salvar os dados (API, banco de dados, etc.)
    print("Dono: $nomeDono, Gmail: $gmail, Senha: $senha, Barbeiros: $nomesBarbeiros");

    // Exibir uma mensagem de sucesso
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Barbearia cadastrada com sucesso!'),
    ));
  }

  // Função para adicionar um novo campo de barbeiro
  void adicionarBarbeiro() {
    setState(() {
      barbeirosControllers.add(TextEditingController());
    });
  }

  // Função para remover um campo de barbeiro
  void removerBarbeiro(int index) {
    setState(() {
      barbeirosControllers.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Barbeiro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: nomeDonoController,
                decoration: InputDecoration(
                  labelText: 'Nome do Dono',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: gmailController,
                decoration: InputDecoration(
                  labelText: 'Gmail',
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
              // Título para os barbeiros
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Nomes dos Barbeiros:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 8),
              // Campos de barbeiros
              Column(
                children: [
                  for (int i = 0; i < barbeirosControllers.length; i++) 
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: barbeirosControllers[i],
                            decoration: InputDecoration(
                              labelText: 'Nome do Barbeiro ${i + 1}',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.remove_circle),
                          onPressed: () => removerBarbeiro(i),
                        ),
                      ],
                    ),
                ],
              ),
              SizedBox(height: 8),
              ElevatedButton.icon(
                onPressed: adicionarBarbeiro,
                icon: Icon(Icons.add),
                label: Text('Adicionar Barbeiro'),
              ),
              SizedBox(height: 32),
              ElevatedButton(
              onPressed: () {
                  // Navegar para a HomePage (tela principal) após login
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => IniBarbeiro()),
                  );
                }, 
                child: Text('Cadastrar Barbearia'),
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
