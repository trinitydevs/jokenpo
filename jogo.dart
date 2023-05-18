import 'dart:math';
import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("../img/padrao.png");
  var _mensagem = "Escolha uma opção abaixo";

 //Método
  void _opcaoSelecionada(String escolhaUsuario){
    var opcoes = ['pedra', 'papel', 'tesoura'];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];
    
    print("Opção selecionada: " + escolhaUsuario);
    print("Opção APP: " + escolhaApp);

     switch (escolhaApp) {
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage("../img/pedra.png");
        });
        break;

      case "papel":
        setState(() {
          this._imagemApp = AssetImage("../img/papel.png");
        });
        break;

      case "tesoura":
        setState(() {
          this._imagemApp = AssetImage("../img/tesoura.png");
        });
        break;
    }
    if((escolhaUsuario == "pedra" && escolhaApp == "tesoura") || (escolhaUsuario == "tesoura" && escolhaApp == "papel") || (escolhaUsuario == "papel" && escolhaApp == "pedra")){
      setState(() {
        _mensagem = "Você venceu!";
      });
    }else if((escolhaUsuario == "pedra" && escolhaApp == "papel") || (escolhaUsuario == "tesoura" && escolhaApp == "pedra") || (escolhaUsuario == "papel" && escolhaApp == "tesoura")){
      _mensagem = "Você perdeu!";
    }else{
      _mensagem = "Empate!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("JokenPo"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //texto - Escolha do App
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                "Escolha do App",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            //Imagem
            Image(image: this._imagemApp),
           
            //Texto - Resultado
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                "$_mensagem",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
           
            Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => _opcaoSelecionada("pedra"),
                  child: Image.asset("../img/pedra.png", height: 100,),
                ),
                GestureDetector(
                  onTap: () => _opcaoSelecionada("papel"),
                  child: Image.asset("../img/papel.png", height: 100,),
                ),
                GestureDetector(
                  onTap: () => _opcaoSelecionada("tesoura"),
                  child: Image.asset("../img/tesoura.png", height: 100,),
                ) 
              ],
            )
          ],
        ));
  }
}