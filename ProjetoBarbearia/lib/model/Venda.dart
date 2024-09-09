import 'package:flutter/material.dart';

class Venda {
  int? idVenda; // Identificador único da venda
  int? idCliente; // Identificador do cliente que fez a compra
  DateTime? dataVenda; // Data em que a venda foi realizada
  String? horaVenda; // Hora em que a venda foi realizada

  // Construtor da classe Venda
  Venda({
    this.idVenda,
    this.idCliente,
    this.dataVenda,
    this.horaVenda,
  });

  // Método que converte o objeto Venda em um Map
  // Útil para serializar o objeto, por exemplo, ao salvar em um banco de dados ou enviar via API
  Map<String, dynamic> toMap() {
    return {
      'idVenda': idVenda, // Atribui o valor de idVenda à chave 'idVenda' no mapa
      'idCliente': idCliente, // Atribui o valor de idCliente à chave 'idCliente' no mapa
      'dataVenda': dataVenda, // Converte DateTime para string ISO 8601, se não for nulo
      'horaVenda': horaVenda, // Atribui o valor de horaVenda à chave 'horaVenda' no mapa
    };
  }

  // Factory constructor que cria uma instância de Venda a partir de um Map
  // Útil para criar uma instância da classe usando dados armazenados em formato de mapa
  factory Venda.fromMap(Map<String, dynamic> map) {
    return Venda(
      idVenda: map['idVenda'], // Extrai o valor de 'idVenda' do mapa e atribui a idVenda
      idCliente: map['idCliente'], // Extrai o valor de 'idCliente' do mapa e atribui a idCliente
      dataVenda: map['dataVenda'] != null ? DateTime.parse(map['dataVenda']) : null, // Converte string para DateTime, se não for nulo
      horaVenda: map['horaVenda'], // Extrai o valor de 'horaVenda' do mapa e atribui a horaVenda
    );
  }
}
