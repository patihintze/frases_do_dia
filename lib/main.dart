import 'dart:math';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _frases = [
    "Quinta é quase sexta",
    "Dias de luta, dias de glória",
    "É só questão de tempo, seja paciente",
    "No pain no gain!!",
  ];

  var _fraseGerada = "Clique abaixo para gerar uma frase: ";

  void _gerarFrase(){
    var numeroSorteado = Random().nextInt(_frases.length);
    setState(() {
      _fraseGerada = _frases[numeroSorteado];
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
        title: Text("Frases do dia", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.green,
          centerTitle: true,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(width: 3, color: Colors.amber)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("images/logo.png"),
            Text(
              _fraseGerada,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 17,
                fontStyle: FontStyle.italic,
                color: Colors.black,
              ),
            ),
            ElevatedButton(
                child: Text(
                  "Nova frase",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                  ),
                ),

              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,),
                onPressed: _gerarFrase,
            ),
          ],
        )
      ),
    );
  }
}
