import 'package:flutter/material.dart';
import 'dart:math';

void main(){
  runApp(MaterialApp(
    title:"Jokempo",
    debugShowCheckedModeBanner: false,
    debugShowMaterialGrid: false,
    home: JokemPo()
  ));
}


class JokemPo extends StatefulWidget {
  @override
  _JokemPoState createState() => _JokemPoState();
}

class _JokemPoState extends State<JokemPo> {

  int _pontuacaoUsuario = 0;

  int _pontuacaoApp = 0;

  String _infoJogo = "Jokempô\n Challenge";

  var _imagemApp = AssetImage("imagens/inicio_app.png");

  var _appEscolha = "Aguardando";

  var _mensagem = "Que comecem os jogos, melhor de 3.";

  void _verificarFimJogo(int vencedor){
    // VitoriaUsuario = 1
    // VitoriaApp = 2
    if(vencedor == 1){
      _pontuacaoUsuario++;
    }else{
      _pontuacaoApp++;
    }
    if(_pontuacaoUsuario == 3){
      _mensagem = "Parabéns, você ganhou o jogo!";
      _infoJogo = "Reiniciar\n Partida";
      _appEscolha = "Aguardando";
    }else if(_pontuacaoApp == 3){
      _mensagem = "Que pena, você perdeu";
      _infoJogo = "Reiniciar\n Partida";
      _appEscolha = "Aguardando";
    }
  }
  void _restartGame(){
    _pontuacaoUsuario = 0;
    _pontuacaoApp = 0;
    _mensagem = "Que comecem os jogos, melhor de 3.";
    setState(() {
      this._imagemApp = AssetImage("imagens/inicio_app.png");
    });
    _infoJogo = "Jokempô\n Challenge";
    _appEscolha = "Aguardando";
  }

  void _opcaoSelecionada(String escolhaUsuario){

    var opcoes = ['Pedra', 'Papel', 'Tesoura'];

    var numeros = Random().nextInt(3);

    _appEscolha = opcoes[numeros];

    print("Escolha selecionada: $escolhaUsuario");

    print('Escolha App $_appEscolha');

    switch(_appEscolha)
    {
      case "Pedra":
        setState(() {
          this._imagemApp = AssetImage("imagens/pedra_app.png");
        });
        break;
      case "Papel":
        setState(() {
          this._imagemApp = AssetImage("imagens/papel_app.png");
        });
        break;
      case "Tesoura":
        setState(() {
          this._imagemApp = AssetImage("imagens/tesoura_app.png");
        });
        break;
    }

    if(
    (escolhaUsuario == 'Pedra' && _appEscolha == 'Pedra')||
        (escolhaUsuario == 'Papel' && _appEscolha == 'Papel')||
          (escolhaUsuario == 'Tesoura' && _appEscolha == 'Tesoura')
    ){
      _mensagem = "Deu empate, tente novamente!";
    }else if((escolhaUsuario == 'Papel' && _appEscolha == 'Pedra')||
            (escolhaUsuario == 'Pedra' && _appEscolha == 'Tesoura')||
            (escolhaUsuario == 'Tesoura' && _appEscolha == 'Papel')){
      _mensagem = "Parabéns, você venceu esta rodada !";
      _verificarFimJogo(1);
    }else{
      _mensagem = "Que pena, você perdeu esta rodada !";
      _verificarFimJogo(2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F3F7),
      body: Container(
        child: Wrap(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(19, 53, 19,0),
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Color(0xFF2962FF),
                        Color(0xFF7B1FA2),
                        Color(0xFFFF1744)
                      ]
                  ),
                  borderRadius: BorderRadius.circular(100)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "Você",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18
                    ),
                  ),
                  Text(
                      this._pontuacaoUsuario.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.bold
                      )
                  ),
                  Transform.rotate(
                    angle: -0.20,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: (){this._restartGame();},
                          child: Text(
                              this._infoJogo,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Open Sans'
                              )
                          ),
                        )
                        ,
                        /*Text(
                          "Challenge",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16
                          )
                      )*/
                      ],
                    ),
                  ),
                  Text(
                      this._pontuacaoApp.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.bold
                      )
                  ),
                  Text(
                      "App",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18
                      )
                  ),
                ],
              ),
            ),
            Container(

              alignment: Alignment.center,
              width: double.infinity,
              margin: EdgeInsets.only(top: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    this._mensagem,
                    style: TextStyle(
                        color: Color(0xFF7B1FA2),
                        fontSize: 19
                    ),
                  )
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                //1)text
                //2)Imagem
                //3)text
                //4)line - 3 figures
                Padding(
                  padding: EdgeInsets.only(top: 35, bottom: 35),
                  child: Text(
                    "Escolha do app",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 25),
                      child: Image(image: _imagemApp, width: 110)
                    ),
                    Text(
                        _appEscolha,
                        style: TextStyle(
                          fontSize: 18
                        ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 32, bottom: 16),
                  child: Text(
                    "Escolha uma opção abaixo",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                          width: 115,
                          height: 125,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10.0, // soften the shadow
                                  spreadRadius: 3.0, //extend the shadow
                                  offset: Offset(
                                    5.0, // Move to right 10  horizontally
                                    5.0, // Move to bottom 10 Vertically
                                  )
                              )
                            ],
                          ),
                          child: Column(
                            children: <Widget>[
                              GestureDetector(
                                onTap: (){_opcaoSelecionada("Pedra");},
                                child: Image.asset('imagens/pedra.png', height: 90),
                              ),
                              Text(
                                "Pedra",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color:Colors.black
                                ),
                              )
                            ],
                          )
                      ),
                      // Image.asset('imagens/pedra.png', height: 95),
                      Container(
                          width: 115,
                          height: 125,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10.0, // soften the shadow
                                  spreadRadius: 3.0, //extend the shadow
                                  offset: Offset(
                                    5.0, // Move to right 10  horizontally
                                    5.0, // Move to bottom 10 Vertically
                                  )
                              )
                            ],
                          ),
                          child:Column(
                            children: <Widget>[

                              GestureDetector(
                                onTap: (){_opcaoSelecionada("Papel");},
                                child: Image.asset('imagens/papel.png', height: 90),
                              ),
                              Text(
                                  "Papel",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color:Colors.black
                                  )
                              )
                            ],
                          )
                      ),
                      Container(
                          width: 115,
                          height: 125,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 10.0, // soften the shadow
                                    spreadRadius: 3.0, //extend the shadow
                                    offset: Offset(
                                      5.0, // Move to right 10  horizontally
                                      5.0, // Move to bottom 10 Vertically
                                    )
                                )
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Column(
                            children: <Widget>[
                              GestureDetector(
                                onTap: (){_opcaoSelecionada("Tesoura");},
                                child: Image.asset('imagens/tesoura.png', height: 90),
                              ),
                              Text(
                                  "Tesoura",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color:Colors.black
                                  )
                              )
                            ],
                          )
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      )
    );
  }
}