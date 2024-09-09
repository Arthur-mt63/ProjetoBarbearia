import 'package:app/control/userController.dart';
import 'package:app/model/usuario.dart';
import 'package:flutter/material.dart';

class Tabela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro e Catálogo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: UserRegistrationScreen(),
    );
  }
}

class UserRegistrationScreen extends StatefulWidget {
  @override
  _UserRegistrationScreenState createState() => _UserRegistrationScreenState();
}

class _UserRegistrationScreenState extends State<UserRegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  
  // Controladores para os campos do formulário
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _bairroController = TextEditingController();
  final TextEditingController _cepController = TextEditingController();
  final TextEditingController _numeroController = TextEditingController();
  final TextEditingController _complementoController = TextEditingController();
  
  String? _gender;
  int? _selectedDay;
  String? _selectedMonth;
  int? _selectedYear;
  
  final List<int> _days = List.generate(31, (index) => index + 1);
  final List<String> _months = [
    'Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho',
    'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'
  ];
  final List<int> _years = List.generate(122, (index) => DateTime.now().year - index);

  // Método para salvar o cadastro
  void salvarcadastro() async {
    if (_selectedDay == null || _selectedMonth == null || _selectedYear == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Por favor, selecione uma data de nascimento completa'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 5),
        ),
      );
      return;
    }

    try {
      Usuariocontroller usuariocontroller = Usuariocontroller();
      
      // Converter os dados para uma instância de Usuario
      Usuario usuario = Usuario(
        nome: _nameController.text,
        cpf: int.tryParse(_cpfController.text),
        dataNasc: DateTime(
          _selectedYear!, 
          _months.indexOf(_selectedMonth!) + 1, 
          _selectedDay!
        ),
        emailUsuario: _emailController.text,
        bairro: _bairroController.text,
        cep: int.tryParse(_cepController.text),
        numero: int.tryParse(_numeroController.text),
        complemento: _complementoController.text,
        tipoUsuario: _gender,
      );

      // Salvar o usuário
      int userid = await usuariocontroller.addUser(usuario);
      
      // Limpar o formulário após o cadastro
      _clearForm();
      
      // Exibir mensagem de sucesso
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Cadastro realizado com sucesso'),
          backgroundColor: const Color.fromARGB(255, 76, 175, 80),
          duration: Duration(seconds: 5),
        ),
      );
    } catch (e) {
      // Tratar erros ao salvar cadastro
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao realizar cadastro: $e'),
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
        backgroundColor: Colors.orange,
        title: Text('Cadastro de Usuário'),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CatalogScreen()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    border: OutlineInputBorder(),
                  ),
                ),
                // SizedBox(height: 16.0),
                // _buildDropdown<int>('Dia', _selectedDay, _days, (value) {
                //   setState(() {
                //     _selectedDay = value;
                //   });
                // }),
                // SizedBox(height: 16.0),
                // _buildDropdown<String>('Mês', _selectedMonth, _months, (value) {
                //   setState(() {
                //     _selectedMonth = value;
                //   });
                // }),
                // SizedBox(height: 16.0),
                // _buildDropdown<int>('Ano', _selectedYear, _years, (value) {
                //   setState(() {
                //     _selectedYear = value;
                //   });
                // }),
                SizedBox(height: 16.0),
                TextField(
                  controller: _ageController,
                  decoration: InputDecoration(
                    labelText: 'Idade',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 16.0),
                _buildDropdown<String>('Sexo', _gender, ['Masculino', 'Feminino', 'Outro'], (value) {
                  setState(() {
                    _gender = value;
                  });
                }),
                SizedBox(height: 16.0),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _cpfController,
                  decoration: InputDecoration(
                    labelText: 'CPF',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _addressController,
                  decoration: InputDecoration(
                    labelText: 'Endereço',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _bairroController,
                  decoration: InputDecoration(
                    labelText: 'Bairro',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _cepController,
                  decoration: InputDecoration(
                    labelText: 'CEP',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _numeroController,
                  decoration: InputDecoration(
                    labelText: 'Número',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _complementoController,
                  decoration: InputDecoration(
                    labelText: 'Complemento',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 32.0),
                ElevatedButton(
                  onPressed: () {
                    salvarcadastro();
                  },
                  child: Text('Cadastrar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                    textStyle: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown<T>(String label, T? value, List<T> items, void Function(T?) onChanged) {
    return DropdownButtonFormField<T>(
      value: value,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      items: items.map<DropdownMenuItem<T>>((T item) {
        return DropdownMenuItem<T>(
          value: item,
          child: Text(item.toString()),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }

  void _clearForm() {
    _nameController.clear();
    _ageController.clear();
    _emailController.clear();
    _cpfController.clear();
    _addressController.clear();
    _bairroController.clear();
    _cepController.clear();
    _numeroController.clear();
    _complementoController.clear();
    setState(() {
      _gender = null;
      _selectedDay = null;
      _selectedMonth = null;
      _selectedYear = null;
    });
  }
}

class CatalogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Catálogo de Cortes e Estilos'),
      ),
      body: GridView(
        padding: EdgeInsets.all(16.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
        ),
        children: [], // Adicionar widgets para o catálogo aqui
      ),
    );
  }
}
