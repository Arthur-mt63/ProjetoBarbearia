import 'package:intl/intl.dart';

class Formatacaodatahora {
  DateTime now = DateTime.now();

  // Formatação de data e hora
  static String datformataData(DateTime data) {
    return DateFormat('dd/MM/yyyy').format(data);
  }

  String formataHora(DateTime hora){
    return DateFormat('HH:mm:ss').format(hora);
  }

}
