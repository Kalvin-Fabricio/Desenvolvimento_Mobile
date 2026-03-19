import 'package:flutter/material.dart';

class ResultadoScreen extends StatelessWidget{
  const ResultadoScreen({super.key});

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

      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            SizedBox(height: 50),

            Image.asset('assets/papel.png'),
            SizedBox(height: 10),
            Text(
              'Escolha do APP',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),

            SizedBox(height: 80),

            Image.asset('assets/pedra.png'),
            SizedBox(height: 10),
            Text(
              'Sua Escolha',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),

            ),

            SizedBox(height: 50),

            Image.asset('assets/icons8-perder-48.png', width: 140, fit: BoxFit.contain,),
            Text(
              'Você Perdeu/venceu',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),

            SizedBox(height: 10),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(180, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10)),
                backgroundColor: Colors.red,
              ),
              onPressed: () {},
              child: const Text(
                "Jogar novamente",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),

          ],
        ),
      ),

    );

  }
}