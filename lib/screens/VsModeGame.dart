import 'dart:async';
import 'dart:math';

import 'package:demogame/utils/animations_comments.dart';
import 'package:demogame/utils/dialogs.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class VsModeGame extends StatefulWidget {
  @override
  _VsModeGameState createState() => _VsModeGameState();
}

class _VsModeGameState extends State<VsModeGame> {
  List<Widget> cardAnimatedList;
  List<int> cardList;
  List<bool> isSelectedList;
  int cardSelected1;
  int cardSelected2;
  int cardIndex1;
  int cardIndex2;
  int globalIndex = 0;
  int stars;
  int cardSelected;
  bool isProcessed;
  bool gameStart;
  bool sonPares;
//cronometro
  final _stopWatch = new Stopwatch();
  final _timeout = const Duration(seconds: 1);
  Stopwatch stopwatch;
  String cronometroTime;
  int puntosPlayer1;
  int puntosPlayer2;
  bool playerActive;
  int movimientos;
  int pares;
  int combo;
  int ancho = 3;
  int largo = 2;
  String textAnimation;

  @override
  void initState() {
    // TODO: implement initState
    //_initialValues();
    _inicializarValues();
    super.initState();
  }

  _inicializarValues() {
    textAnimation = "¡Bien!";
    stars = 0;
    cronometroTime = "00:00";
    cardAnimatedList = [];
    cardList = [];
    isSelectedList = [];
    cardSelected1 = 0;
    cardSelected2 = 0;
    cardIndex1 = 0;
    cardIndex2 = 0;
    cardSelected = 0;
    isProcessed = false;
    gameStart = false;
    sonPares = false;
    puntosPlayer1 = 0;
    puntosPlayer2 = 0;
    playerActive = true;
    movimientos = 0;
    pares = 0;
    combo = 1;
    stopwatch = new Stopwatch();
    _startStopButtonPressed();
  }

  @override
  Widget build(BuildContext context) {
    //final String dimention = ModalRoute.of(context).settings.arguments;
    if (true && !gameStart) {
      ancho = 9;
      largo = 8;
      _initialValues(globalIndex = ((ancho * largo) / 2).round());
      gameStart = !gameStart;
    }
    return Scaffold(
      appBar: new PreferredSize(
          child: Container(), preferredSize: Size.fromHeight(0)),
      body: Center(
          child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Color.fromRGBO(248, 6, 50, 0.5), BlendMode.color),
                  fit: BoxFit.fill,
                  image: AssetImage(
                    "assets/image/background/background_mosaico.png",
                  )),
            ),
            child: Column(
              children: <Widget>[
                barToVictorius(),
                Expanded(child: cardListMethod()),
              ],
            ),
          ),
          sonPares ? AnimationsComments(textAnimation) : Container(),
        ],
      )),
    );
  }

  Widget cardListMethod() {
    return Container(
      margin: EdgeInsets.all(10),
      child: GridView.count(
        crossAxisCount: ancho,
        childAspectRatio: (100 / 130),
        children: List.generate(cardList.length, (index) {
          return Center(
              child: Container(
            margin: EdgeInsets.all(.5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              border: Border.all(color: Colors.black, width: 3),
            ),
            child: RaisedButton(
                padding: EdgeInsets.all(0),
                color: Colors.white,
                onPressed: () => !isSelectedList[index]
                    ? _onClick(index, cardList[index])
                    : () {},
                child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/image/cards/" +
                                cardList[index].toString() +
                                ".png"),
                            fit: BoxFit.contain)),
                    child: cardAnimatedList[index])),
          ));
        }),
      ),
    );
  }

  Widget barToVictorius() {
    var width = MediaQuery.of(context).size.width;
    return new Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(5)),
        color: Color.fromRGBO(248, 6, 50, 1),
      ),
      width: width,
      child: Column(children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 2, left: 2, right: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(5)),
            color: Color.fromRGBO(30, 30, 30, 1),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Text("P1",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontSize: 25,
                                fontFamily: "Gamer",
                                color:
                                    playerActive ? Colors.cyan : Colors.white)),
                      ],
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Positioned(
                          left: 20,
                          child: Container(
                            width: 50,
                            height: 20,
                            padding: EdgeInsets.symmetric(horizontal: 3),
                            decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(movimientos.toString(),
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontSize: 25, fontFamily: "Gamer")),
                          ),
                        ),
                        Container(
                          width: 70,
                          height: 35,
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    alignment: Alignment.centerLeft,
                                    image: AssetImage(
                                        "assets/image/icons/card_rotation.png"))),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Positioned(
                          left: 20,
                          child: Container(
                            width: 50,
                            height: 20,
                            padding: EdgeInsets.symmetric(horizontal: 3),
                            decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(cronometroTime,
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontSize: 25, fontFamily: "Gamer")),
                          ),
                        ),
                        Container(
                          width: 70,
                          height: 30,
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    alignment: Alignment.centerLeft,
                                    image: AssetImage(
                                        "assets/image/icons/sand_clock.png"))),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Positioned(
                          left: 20,
                          child: Container(
                            width: 50,
                            height: 20,
                            padding: EdgeInsets.symmetric(horizontal: 3),
                            decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(movimientos.toString(),
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontSize: 25, fontFamily: "Gamer")),
                          ),
                        ),
                        Container(
                          width: 70,
                          height: 35,
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    alignment: Alignment.centerLeft,
                                    image: AssetImage(
                                        "assets/image/icons/card_rotation.png"))),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: <Widget>[
                        Text("P2",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontSize: 25,
                                fontFamily: "Gamer",
                                color:
                                    playerActive ? Colors.white : Colors.cyan)),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Positioned(
                          left: 0,
                          child: Container(
                            width: 110,
                            height: 20,
                            padding: EdgeInsets.symmetric(horizontal: 3),
                            decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Puntos  ",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        fontSize: 25, fontFamily: "Gamer")),
                                Text(puntosPlayer1.toString(),
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        fontSize: 25, fontFamily: "Gamer")),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 130,
                          height: 40,
                        ),
                      ],
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Positioned(
                          left: 20,
                          child: Container(
                            width: 110,
                            height: 20,
                            padding: EdgeInsets.symmetric(horizontal: 3),
                            decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Puntos  ",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        fontSize: 25, fontFamily: "Gamer")),
                                Text(puntosPlayer2.toString(),
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        fontSize: 25, fontFamily: "Gamer")),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 130,
                          height: 40,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }

  _onClick(int index, int cardIndex) {
    if (!isProcessed) {
      setState(() {
        cardAnimatedList[index] = _cardAnimated("card_animation_left");
        isSelectedList[index] = true;
      });
      _validCardPar(index, cardIndex);
    }
  }

  _validCardPar(int index, int cardIndex) async {
    cardSelected++;
    if (cardSelected == 1) {
      cardIndex1 = index;
      cardSelected1 = cardIndex;
    } else {
      cardIndex2 = index;
      cardSelected2 = cardIndex;
      if (cardSelected1 == cardSelected2) {
        setState(() {
          combo > 1
              ? textAnimation = "Combo X" + combo.toString()
              : textAnimation = "¡Bien!";
          cardSelected = 0;
          if (playerActive) {
            puntosPlayer1 += 100 * combo;
          } else {
            puntosPlayer2 += 100 * combo;
          }

          combo++;
          movimientos++;
          pares++;
          sonPares = true;
          _endGame();
        });
        await Future.delayed(const Duration(milliseconds: 1000), () {});
        setState(() {
          sonPares = false;
        });
      } else {
        setState(() {
          combo = 1;
          isProcessed = true;
          movimientos++;
        });
        await Future.delayed(const Duration(seconds: 1), () {});
        setState(() {
          isSelectedList[cardIndex1] = false;
          isSelectedList[cardIndex2] = false;
          cardAnimatedList[cardIndex1] = _cardAnimated("card_animation_right");
          cardAnimatedList[cardIndex2] = _cardAnimated("card_animation_right");
          isProcessed = false;
          cardSelected = 0;
        });
      }
      playerActive = !playerActive;
    }
  }

  Widget _cardAnimated(String name) {
    return FlareActor("assets/animations/card_joker.flr",
        shouldClip: false,
        alignment: Alignment.center,
        fit: BoxFit.fill,
        animation: name);
  }

  _initialValues(int dimention) {
    int i = 0;
    int pos = 0;
    List<int> numerosAleatorios = [];
    while (i < dimention) {
      pos = Random().nextInt(36 + 1);
      while (!numerosAleatorios.contains(pos) && pos != 0) {
        numerosAleatorios.add(pos);
        isSelectedList.add(false);
        isSelectedList.add(false);
        cardAnimatedList.add(_cardAnimated(""));
        cardAnimatedList.add(_cardAnimated(""));
        i++;
      }
    }
    cardList =
        _combineCards(List.from(numerosAleatorios)..addAll(numerosAleatorios));
  }

  _calcularPuntos() {
    int valorBase = ancho * largo;
    int valorTiempo = int.parse(cronometroTime.replaceAll(":", ""));
    puntosPlayer1 += (puntosPlayer1 / movimientos).round();
    puntosPlayer1 += (puntosPlayer1 / valorTiempo).round();
    if (movimientos <= valorBase && valorTiempo <= ancho * 100) {
      stars = 100;
    } else {
      if (movimientos <= (valorBase * 1.3).round() &&
          valorTiempo <= ((ancho * 100) * 1.3).round()) {
        stars = 50;
      } else {
        if (movimientos <= (valorBase * 1.5).round() &&
            valorTiempo <= ((ancho * 100) * 1.5).round()) {
          stars = 30;
        } else {
          stars = 0;
        }
      }
    }
  }

  _endGame() async {
    if (pares == globalIndex) {
      _calcularPuntos();
      await Future.delayed(const Duration(milliseconds: 500), () {});
      _taparCartas();
      _stopWatch.stop();
      await Future.delayed(const Duration(seconds: 1), () {});
      Dialogs.alertWin(context,
          title: "You Win",
          message: "Puntos: " +
              puntosPlayer1.toString() +
              "\nMovimientos: " +
              movimientos.toString() +
              "\nTiempo: " +
              cronometroTime,
          stars: true,
          starValue: stars, onContinue: () {
        setState(() {
          _stopWatch.reset();
          _inicializarValues();
          _initialValues(globalIndex);
        });
        Navigator.of(context).pop();
      });
    }
  }

  _taparCartas() {
    int i = 0;
    while (i < globalIndex + globalIndex) {
      cardAnimatedList[i] = _cardAnimated("card_animation_right");
      i++;
    }
  }

  List<int> _combineCards(List<int> numerosAleatorios) {
    Random r = new Random();
    for (int i = numerosAleatorios.length; i > 0; i--) {
      int posicion = r.nextInt(i);
      int tmp = numerosAleatorios[i - 1];
      numerosAleatorios[i - 1] = numerosAleatorios[posicion];
      numerosAleatorios[posicion] = tmp;
    }
    print(numerosAleatorios);
    return numerosAleatorios;
  }

  void _startTimeout() {
    new Timer(_timeout, _handleTimeout);
  }

  void _handleTimeout() {
    if (_stopWatch.isRunning) {
      _startTimeout();
    }
    if (!mounted) return;
    setState(() {
      _setStopwatchText();
    });
  }

  _startStopButtonPressed() {
    if (!mounted) return;
    setState(() {
      _stopWatch.start();
      _startTimeout();
    });
  }

  void _setStopwatchText() {
    cronometroTime =
        (_stopWatch.elapsed.inMinutes % 60).toString().padLeft(2, '0') +
            ':' +
            (_stopWatch.elapsed.inSeconds % 60).toString().padLeft(2, '0');
  }
}