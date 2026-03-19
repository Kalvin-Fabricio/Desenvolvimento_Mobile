import 'package:atividade_01/screens/resultado_screen.dart';
import 'package:flutter/material.dart';
import 'screens/escolha_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EscolhaScreen(), //Aqui muda qual tela exibir
    );
  }

}


