import 'package:flutter/material.dart';

class Enderecousuario {

int? idEnderecoUsuario;
int? idUsuario;
String? bairro;
String? cep;
int? numero;
Text? complemento;

Enderecousuario({

  this.idEnderecoUsuario,
  this.idUsuario,
  this.bairro,
  this.cep,
  this.numero,
  this.complemento,
});

Map<String, dynamic> toMap() {
  return {
    'idEnderecoUsuario': idEnderecoUsuario,
    'idUsuario': idUsuario,
    'bairro': bairro,
    'cep': cep,
    'numero': numero,
    'complemento': complemento,
  };
}

factory Enderecousuario.fromMap(Map<String, dynamic> map) {
  return Enderecousuario(
    idEnderecoUsuario: map['idEnderecoUsuario'],
    idUsuario: map['idUsuario'],
    bairro: map['bairro'],
    cep: map['cep'],
    numero: map['numero'],
    complemento: map['complemento'],
  );
}
}