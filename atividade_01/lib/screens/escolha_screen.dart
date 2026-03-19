import 'package:flutter/material.dart';

class EscolhaScreen extends StatelessWidget{
  const EscolhaScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar (
          backgroundColor: Colors.red,
          title: Text(
              'Pedra, Papel e Tesoura',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
              )
          )
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 50),
          Image.asset('assets/padrao.png'),
          SizedBox(height: 10),
          Text (
              'Escolha do APP',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
              )
          ),
          SizedBox(height: 120),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Image.asset('assets/pedra.png', width: 90),
              ),
              SizedBox(width: 10),
              Flexible(
                child: Image.asset('assets/papel.png', width: 90),
              ),
              SizedBox(width: 10),
              Flexible(
                child: Image.asset('assets/tesoura.png', width: 90),
              ),
            ],
          )
        ],
      ),
    );
  }

}