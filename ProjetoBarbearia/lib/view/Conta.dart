import 'dart:io';
import 'package:app/control/userController.dart';
import 'package:app/model/usuario.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:app/view/LoginView.dart';

class Conta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CreateAccountScreen(),
    );
  }
}

class CreateAccountScreen extends StatefulWidget {
  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController neighborhoodController = TextEditingController();
  final TextEditingController cepController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController barberShopNameController =
      TextEditingController();
  final TextEditingController userTypeController = TextEditingController();
  File? _profileImage;

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  void _showImageSourceOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Galeria'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Câmera'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage(ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void salvarcadastro() async {
    try {
      Usercontroller useController = Usercontroller();

      Usuario usuario = Usuario(
        nome: nameController.text,
        cpf: cpfController.text,
        dataNasc: dobController.text,
        tipoUsuario: userTypeController.text,
        usuario: barberShopNameController.text,
        emailUsuario: emailController.text,
        senhaUsuario: passwordController.text,
        bairro: neighborhoodController.text,
        cep: cepController.text,
        numero: numberController.text,
        complemento:
            '', // Salvar o caminho da imagem como complemento, se disponível
      );

      int userId = await useController.addUser(usuario);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Cadastro realizado com sucesso!"),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 5),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Cadastro não realizado!"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 5),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar conta'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: _showImageSourceOptions,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[200],
                  backgroundImage:
                      _profileImage != null ? FileImage(_profileImage!) : null,
                  child: _profileImage == null
                      ? Icon(Icons.camera_alt,
                          size: 50, color: Colors.grey[600])
                      : null,
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Preencha o formulário abaixo com seus dados',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 30),
              buildTextField('Nome Completo', nameController),
              buildTextField('CPF', cpfController),
              buildTextField('Data de Nascimento', dobController),
              buildTextField('E-mail', emailController),
              buildTextField('Senha', passwordController, isPassword: true),
              buildTextField('Bairro', neighborhoodController),
              buildTextField('CEP', cepController),
              buildTextField('Número', numberController),
              buildTextField('Nome da Barbearia', barberShopNameController),
              buildTextField('Tipo do usuário', userTypeController),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    salvarcadastro();
                  },
                  child: Text('Cadastrar'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, TextEditingController controller,
      {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
