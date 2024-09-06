import 'package:flutter/material.dart';

class EditarPerfilBarbeiroPage extends StatefulWidget {
  @override
  _EditarPerfilBarbeiroPageState createState() => _EditarPerfilBarbeiroPageState();
}

class _EditarPerfilBarbeiroPageState extends State<EditarPerfilBarbeiroPage> {
  final _formKey = GlobalKey<FormState>();
  String _nome = 'Nome do Barbeiro';
  String _email = 'email@exemplo.com';
  String _telefone = '(99) 99999-9999';
  String _especialidade = 'Especialidade';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Perfil do Barbeiro'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Nome',
                style: TextStyle(fontSize: 16),
              ),
              TextFormField(
                initialValue: _nome,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Digite seu nome',
                ),
                onChanged: (value) {
                  setState(() {
                    _nome = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite seu nome';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              Text(
                'Email',
                style: TextStyle(fontSize: 16),
              ),
              TextFormField(
                initialValue: _email,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Digite seu email',
                ),
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite seu email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Digite um email válido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              Text(
                'Telefone',
                style: TextStyle(fontSize: 16),
              ),
              TextFormField(
                initialValue: _telefone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Digite seu telefone',
                ),
                onChanged: (value) {
                  setState(() {
                    _telefone = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite seu telefone';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              Text(
                'Especialidade',
                style: TextStyle(fontSize: 16),
              ),
              TextFormField(
                initialValue: _especialidade,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Digite sua especialidade',
                ),
                onChanged: (value) {
                  setState(() {
                    _especialidade = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite sua especialidade';
                  }
                  return null;
                },
              ),
              SizedBox(height: 32),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      // Salvar informações
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Perfil salvo com sucesso')),
                      );
                    }
                  },
                  child: Text('Salvar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
