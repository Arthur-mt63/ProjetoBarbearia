import 'package:flutter/material.dart';

class FinanceiroBar extends StatefulWidget {
  @override
  _FinanceiroBarState createState() => _FinanceiroBarState();
}

class _FinanceiroBarState extends State<FinanceiroBar> {
  final TextEditingController _entradaController = TextEditingController();
  final TextEditingController _saidaController = TextEditingController();
  double _total = 0;

  void _calcularTotal() {
    final double entrada = double.tryParse(_entradaController.text) ?? 0;
    final double saida = double.tryParse(_saidaController.text) ?? 0;

    setState(() {
      _total = entrada - saida;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Financeiro da Barbearia'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Calcule o dinheiro que entra e sai da barbearia',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _entradaController,
              decoration: InputDecoration(
                labelText: 'Entrada (R\$)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _saidaController,
              decoration: InputDecoration(
                labelText: 'Saída (R\$)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcularTotal,
              child: Text('Calcular Total'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                textStyle: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Total: R\$ ${_total.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
