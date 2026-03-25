
 // import  do material
import 'package:flutter/material.dart';

//etapa1 - esqueleto da tela

void main() => runApp(MaterialApp(
  home: AppGasolina(),
));

class AppGasolina extends StatelessWidget {

  String _resultado = "";
  void _calcular(){

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold( // o esqueleto visual da tela - com a tag <html>

    appBar : AppBar (
      title: Text("Calculadora de Gasolina ✨")
    ),

  body: Padding(
    padding: EdgeInsets.all(16.0),
    child: Column(
      children: [
        // aqui é onde vao estar nossos elementos (widgets)
      Text(
        "Bem-vindo à Calculadora de Gasolina",
        style: TextStyle(fontSize: 18),
      ),
      SizedBox(height: 24),

       Text(
        "⛽💕Informe o valor da gasolina⛽💕:",
        style: TextStyle(fontSize: 18),
      ),
      SizedBox(height: 20),
      TextField (
        decoration: InputDecoration(
          labelText: "Valor da Gasolina:",
          border: OutlineInputBorder(),

        ),
        keyboardType: TextInputType.number,
      ),
      SizedBox(height: 16),

      TextField (
        decoration: InputDecoration(
          labelText: "Valor do Etanol:",
          border: OutlineInputBorder(),

        ),
        keyboardType: TextInputType.number,
      ),
      SizedBox(height: 16),
      ElevatedButton(
        onPressed: _calcular,
        child: Text("Calcular"),
      ),
      SizedBox(height:36),
      Text(
        _resultado,
        style: TextStyle(fontSize: 16),
        textAlign: TextAlign.center,
      ),
      ],

    ),
  ),


    );
  }
}