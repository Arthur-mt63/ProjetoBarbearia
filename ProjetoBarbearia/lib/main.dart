import 'package:flutter/material.dart';
import 'package:app/view/Agendamento_clin.dart';

import 'package:app/view/Escolha.dart';

import 'package:app/view/Ini_cliente.dart';
import 'package:app/view/LoginView.dart';
import 'package:app/view/Perfil_clin.dart';
import 'package:app/view/Produtoclin.dart';
import 'package:app/view/editar_perfil_bar.dart';
import 'package:app/view/editar_perfil_cli.dart';
import 'package:app/view/tela_buscar_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/login', // Rota inicial do aplicativo
        routes: {
          '/login': (context) => Loginview(), // Tela de Login
          '/Escolha': (context) => EscolhaTela(), // Tela de Escolha de Perfil
          '/home': (context) => IniCliente(), // Tela Inicial do Cliente
          '/products': (context) =>
              Produtoclin(), // Tela de Pesquisa de Produtos
          '/schedule': (context) => Agendamento_clin(), // Tela de Agendamento
          '/profile': (context) => Perfil_clin(), // Tela de Perfil do Cliente
          '/buscar': (context) => BarbeariasScreen(),
          '/editacli': (context) => EditarPerfilPage(),
          '/editbar': (context) => EditarPerfilBarbeiroPage(),
        } // Tela FinanceiroBarbearia
        );
  }
}
