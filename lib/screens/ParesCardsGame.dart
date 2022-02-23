import 'dart:async';
import 'dart:math';

import 'package:demogame/utils/animations_comments.dart';
import 'package:demogame/utils/dialogs.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class ParesCardsGame extends StatefulWidget {
  @override
  _ParesCardsGameState createState() => _ParesCardsGameState();
}

class _ParesCardsGameState extends State<ParesCardsGame> {
  //Grid Values
  //List<ItemCardData> cardContent;

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
  int puntos;
  int movimientos;
  int pares;
  int combo;
  int ancho = 3;
  int largo = 2;
  String textAnimation;
  int level = 0;

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
    puntos = 0;
    movimientos = 0;
    pares = 0;
    combo = 1;
    stopwatch = new Stopwatch();
    _startStopButtonPressed();
  }

  generarNivel(int nivel) {
    if (nivel == 0) {
      ancho = nivel + 2;
      largo = nivel + 3;
    } else {
      if (nivel < 3) {
        ancho = nivel + 1;
        largo = nivel + 2;
      } else {
        if (nivel < 10) {
          ancho = 5;
          largo = 6;
        } else {
          if (nivel < 20) {
            ancho = 6;
            largo = 7;
          } else {
            if (nivel < 30) {
              ancho = 7;
              largo = 8;
            } else {
              if (nivel < 40) {
                ancho = 8;
                largo = 9;
              } else {
                ancho = 9;
                largo = 10;
              }
            }
          }
        }
      }
    }
    _initialValues(globalIndex = ((ancho * largo) / 2).round());
  }

  ImageProvider<Object> convertImage(String svgImage) {
    Image image = Image(
      image: Svg(svgImage),
    );
    return image.image;
  }

  @override
  Widget build(BuildContext context) {
    final String getLevel = ModalRoute.of(context).settings.arguments;
    if (getLevel != null && !gameStart) {
      level = int.parse(getLevel);
      generarNivel(level);
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
                Expanded(child: cardMethod()),
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
        childAspectRatio: (3 / 3),
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
                            image: convertImage("assets/image/cards/" +
                                cardList[index].toString() +
                                ".svg"),
                            fit: BoxFit.contain)),
                    child: cardAnimatedList[index])),
          ));
        }),
      ),
    );
  }

  Widget cardMethod() {
    List<TrackSize> columns = [];
    List<TrackSize> rows = [];
    for (var i = 0; i < ancho; i++) {
      columns.add(1.fr);
    }
    for (var i = 0; i < largo; i++) {
      rows.add(auto);
    }
    return Container(
      padding: EdgeInsets.all(10),
      child: LayoutGrid(
        // set some flexible track sizes based on the crossAxisCount
        columnSizes: columns,
        // set all the row sizes to auto (self-sizing height)
        rowSizes: rows,
        rowGap: 1, // equivalent to mainAxisSpacing
        columnGap: 1, // equivalent to crossAxisSpacing
        // note: there's no childAspectRatio
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
                            image: convertImage("assets/image/cards/" +
                                cardList[index].toString() +
                                ".svg"),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
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
                            style:
                                TextStyle(fontSize: 25, fontFamily: "Gamer")),
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
                            Text(puntos.toString(),
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
                        width: 50,
                        height: 20,
                        padding: EdgeInsets.symmetric(horizontal: 3),
                        decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(cronometroTime,
                            textAlign: TextAlign.right,
                            style:
                                TextStyle(fontSize: 25, fontFamily: "Gamer")),
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
          puntos += 100 * combo;
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
      pos = Random().nextInt(151 + 1);
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
    puntos += (puntos / movimientos).round();
    puntos += (puntos / valorTiempo).round();
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
              puntos.toString() +
              "\nMovimientos: " +
              movimientos.toString() +
              "\nTiempo: " +
              cronometroTime,
          stars: true,
          starValue: stars,
          dobleButton: true, onContinueDobleButton: () {
        Navigator.of(context).pop();
        Navigator.pop(context);
        Navigator.pushNamed(context, "cardsgame",
            arguments: (level + 1).toString());
      }, onContinue: () {
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
