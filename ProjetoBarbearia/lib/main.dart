import 'package:app/view/Cadastro.dart';
import 'package:app/view/clienteView/menuCliente.dart';
import 'package:flutter/material.dart';
import 'view/Login.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppBarber',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),          // Tela de Login
        '/signup': (context) => Menucliente(), //CadastroClienteScreen(), // Tela de Cadastro
      },
    );
  }
}
