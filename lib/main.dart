
import 'package:app/view/Agendamento_clin.dart';
import 'package:app/view/Cadastro.dart';
import 'package:app/view/Escolha.dart';
import 'package:app/view/Ini_cliente.dart';
import 'package:app/view/LoginView.dart';
import 'package:app/view/Perfil_clin.dart';
import 'package:app/view/Produtoclin.dart';
import 'package:app/view/editar_perfil_bar.dart';
import 'package:app/view/editar_perfil_cli.dart';
import 'package:app/view/tela_buscar_bar.dart';

import 'package:flutter/material.dart';






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
      initialRoute: '/login',
      routes: {  
        '/login':(context)=>  Login(),
        '/Escolha': (context) => EscolhaTela(), // Tela de Escolha de Perfil
        '/signup': (context) => CadastroClienteScreen(), // Tela de Cadastro
         '/home': (context) => IniCliente(), // Tela Inicial do       // Tela de Login
          '/products': (context) => Produtoclin(), // Tela de Pesquisa de Produtos
          '/schedule': (context) => Agendamento_clin(), // Tela de Agendamento
          '/profile': (context) => Perfil_clin(), // Tela de Perfil do Cliente
          '/buscar': (context) => BarbeariasScreen(),
          '/editacli':(context) => EditarPerfilPage(),
          '/editbar':(context)=> EditarPerfilBarbeiroPage(),
      },
    );
  }
}