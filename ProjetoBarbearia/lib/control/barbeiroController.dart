import 'package:app/dao/bancoDeDados.dart';
import 'package:app/model/barbeiro.dart';

class Barbeirocontroller {
  final Bancodedados bancodedados = Bancodedados();

  Future<int> salvarBarb(Barbeiro b) async {
    try {
      final db = await Bancodedados().database;
      return await db.insert('Barbeiro', b.toMap());
    } catch (e) {
      print("erro");
      throw "erro";
    }
  }


  
}
