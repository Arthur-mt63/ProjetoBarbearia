import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SelectImageScreen(),
    );
  }
}

class SelectImageScreen extends StatefulWidget {
  @override
  _SelectImageScreenState createState() => _SelectImageScreenState();
}

class _SelectImageScreenState extends State<SelectImageScreen> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  // Função para selecionar uma imagem da galeria
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  // Função para postar a imagem
  void _postImage() {
    if (_image != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Imagem postada com sucesso!'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Selecione uma imagem primeiro'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecionar Imagem'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Mostra a imagem selecionada ou um ícone
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                height: 200,
                width: double.infinity,
                color: Colors.grey[800],
                child: _image != null
                    ? Image.file(
                        _image!,
                        fit: BoxFit.cover,
                      )
                    : Icon(
                        Icons.add_a_photo,
                        size: 50,
                        color: Colors.grey[400],
                      ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _postImage,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: Text(
                'Postar Imagem',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[900],
    );
  }
}
