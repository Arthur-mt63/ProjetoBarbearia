import 'package:app/control/clienteController.dart';
import 'package:app/control/controller/clienteControl.dart';
import 'package:app/model/cliente.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Certifique-se de importar o intl para manipulação de datas

class CadastroClienteScreen extends StatefulWidget {
  @override
  _CadastroClienteScreenState createState() => _CadastroClienteScreenState();
}

class _CadastroClienteScreenState extends State<CadastroClienteScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controladores para os campos de texto
  final _nomeController = TextEditingController();
  final _cpfController = TextEditingController();
  final _usuarioController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _telefoneController = TextEditingController();

  DateTime? _dataNasc;

  // Função para selecionar a data de nascimento
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null && pickedDate != _dataNasc) {
      setState(() {
        _dataNasc = pickedDate;
      });
    }
  }

  // Função para processar o formulário
  Future<void> _processarFormulario() async {
    try {
      if (_formKey.currentState?.validate() ?? false) {
        // Verificar se CPF, e-mail e usuário já existem
        final clienteExiste =
            await Clientecontrol.verificarSeCpfExiste(_cpfController.text);
        final emailExiste =
            await Clientecontrol.verificarSeEmailExiste(_emailController.text);
        final usuarioExiste = await Clientecontrol.verificarSeUsuarioExiste(
            _usuarioController.text);

        if (clienteExiste != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('CPF já cadastrado!'),
              backgroundColor: Colors.red,

            ),
          );
          return;
        }

        if (emailExiste != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('E-mail já cadastrado!'),
              backgroundColor: Colors.red,
            ),
          );
          return;
        }

        if (usuarioExiste != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Nome de usuário já está sendo usado!'),
              backgroundColor: Colors.red,
            ),
          );
          return;
        }

        // Criação do cliente
        final c = Cliente(
          nomeCliente: _nomeController.text,
          cpf: _cpfController.text,
          dataNasc: _dataNasc ?? DateTime.now(),
          usuario: _usuarioController.text,
          emailUsuario: _emailController.text,
          senhaUsuario: _senhaController.text,
          telefone: _telefoneController.text,
        );

        Clientecontroller dao = Clientecontroller();

        //salvar o cliente no banco de dados
        int idClienteRecebido = await dao.salvaCli(c);
        c.idCliente = idClienteRecebido;
        print(c.toMap());

        // Exibir uma mensagem de sucesso
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Cliente ${c.nomeCliente} cadastrado com sucesso!'),
            backgroundColor: const Color.fromARGB(255, 3, 228, 82),
          ),
        );

        // Limpar o formulário após o cadastro
        _limparForm();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Não foi possível cadastrar o cliente! $e"),
          duration: Duration(seconds: 10),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // Função para limpar o formulário
  void _limparForm() {
    _formKey.currentState?.reset(); // Reseta os campos do formulário

    // Limpa todos os controladores
    _nomeController.clear();
    _cpfController.clear();
    _usuarioController.clear();
    _emailController.clear();
    _senhaController.clear();
    _telefoneController.clear();
    setState(() {
      _dataNasc = null;
    });
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
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nomeController,
                  decoration: InputDecoration(labelText: 'Nome Completo'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu nome';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _cpfController,
                  decoration: InputDecoration(labelText: 'CPF'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu CPF';
                    }
                    if (value.length != 11) {
                      return 'CPF deve ter 11 dígitos';
                    }
                    return null;
                  },
                ),
                GestureDetector(
                  onTap: () => _selectDate(context),
                  child: AbsorbPointer(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: _dataNasc == null
                            ? 'Data de Nascimento'
                            : 'Data de Nascimento: ${DateFormat('dd/MM/yyyy').format(_dataNasc!)}',
                      ),
                      validator: (value) {
                        if (_dataNasc == null) {
                          return 'Por favor, selecione sua data de nascimento';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                TextFormField(
                  controller: _usuarioController,
                  decoration: InputDecoration(labelText: 'Nome de Usuário'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira um nome de usuário';
                    } 
                    return null;
                  },
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'E-mail'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu e-mail';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Insira um e-mail válido';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _senhaController,
                  decoration: InputDecoration(labelText: 'Senha'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira sua senha';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _telefoneController,
                  decoration: InputDecoration(labelText: 'Telefone'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _processarFormulario,
                  child: Text('Cadastrar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
