import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({super.key});

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("assets/inicio.png");
  var _mensasem = "Escolha uma opção abaixo";

  void opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes [numero];
    switch (escolhaApp) {
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage("assets/pedra.jpg");
        });
        break;
      case "papel":
        setState(() {
          this._imagemApp = AssetImage("assets/papel.jpg");
        });
        break;
      case "tesoura":
        setState(() {
          this._imagemApp = AssetImage("assets/tesoura.jpg");
        });
        break;
    }
    if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra")) {
      setState(() {
        this._mensasem = "parabéns!! você ganhou";
      });
    } else if
    ((escolhaApp == "pedra" && escolhaUsuario == "tesoura")
        ||
        (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
        (escolhaApp == "papel" && escolhaUsuario == "pedra")) {
      setState(() {
        this._mensasem = "você perdeu";
      });
    }
    else {
      setState(() {
        this._mensasem = "empatou";
      });
    }
  }


@override
Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text("JokenPo")),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 15),
            child: Text(
              "Escolha do Aplicativo",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Image(image: this._imagemApp, height: 100,),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 15),
            child: Text(
              this._mensasem,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => opcaoSelecionada("pedra"),
                child: Image.asset("assets/pedra.jpg", height: 95,),
              ),
              GestureDetector(
                onTap: () => opcaoSelecionada("papel"),
                child: Image.asset("assets/papel.jpg", height: 95,),
              ),
              GestureDetector(
                onTap: () => opcaoSelecionada("tesoura"),
                child: Image.asset("assets/tesoura.jpg", height: 95,),
              )
            ],
          ),
        ],
      ));
}}
