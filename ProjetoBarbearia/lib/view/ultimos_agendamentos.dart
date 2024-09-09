import 'package:flutter/material.dart';
import 'dart:async';

class UltimosAgendamentosPage extends StatefulWidget {
  @override
  _UltimosAgendamentosPageState createState() => _UltimosAgendamentosPageState();
}

class _UltimosAgendamentosPageState extends State<UltimosAgendamentosPage> {
  List<Agendamento> agendamentos = [];

  @override
  void initState() {
    super.initState();
    carregarAgendamentos();
  }

  // Simulação de carregamento de agendamentos (você pode substituir por dados reais de um banco de dados)
  Future<void> carregarAgendamentos() async {
    await Future.delayed(Duration(seconds: 2)); // Simulação de espera

    setState(() {
      agendamentos = [
        Agendamento(nomeCliente: 'João Silva', dataHora: DateTime.now().subtract(Duration(hours: 2))),
        Agendamento(nomeCliente: 'Maria Oliveira', dataHora: DateTime.now().subtract(Duration(days: 1))),
        Agendamento(nomeCliente: 'Pedro Santos', dataHora: DateTime.now().subtract(Duration(days: 2))),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Últimos Agendamentos'),
      ),
      body: agendamentos.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: agendamentos.length,
              itemBuilder: (context, index) {
                final agendamento = agendamentos[index];
                return ListTile(
                  title: Text(agendamento.nomeCliente),
                  subtitle: Text(
                    'Data: ${agendamento.dataHora.day}/${agendamento.dataHora.month}/${agendamento.dataHora.year} '
                    'às ${agendamento.dataHora.hour}:${agendamento.dataHora.minute}',
                  ),
                  leading: Icon(Icons.person),
                );
              },
            ),
    );
  }
}

// Classe do modelo Agendamento
class Agendamento {
  final String nomeCliente;
  final DateTime dataHora;

  Agendamento({required this.nomeCliente, required this.dataHora});
}
