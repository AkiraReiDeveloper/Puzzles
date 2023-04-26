import 'dart:async';
import 'dart:math';

import 'package:demogame/utils/animations_comments.dart';
import 'package:demogame/utils/dialogs.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

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
  bool playerActive;
  int pares;
  int combo;
  int ancho = 3;
  int largo = 2;
  String textAnimation;
  int paresPlayer1;
  int paresPlayer2;

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
    playerActive = true;
    pares = 0;
    combo = 1;
    paresPlayer1 = 0;
    paresPlayer2 = 0;
  }

  ImageProvider<Object> convertImage(String svgImage) {
    Image image = Image(
      image: Svg(svgImage),
    );
    return image.image;
  }

  @override
  Widget build(BuildContext context) {
    //final String dimention = ModalRoute.of(context).settings.arguments;
    if (true && !gameStart) {
      ancho = 6;
      largo = 7;
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
        childAspectRatio: (100 / 130),
        children: List.generate(cardList.length, (index) {
          return Center(
              child: Container(
            margin: EdgeInsets.all(.5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              border: Border.all(color: Colors.black, width: 3),
            ),
            child: ElevatedButton(
                //padding: EdgeInsets.all(0),
                //color: Colors.white,
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
            child: ElevatedButton(
                //padding: EdgeInsets.all(0),
                //color: Colors.white,
                style: ButtonStyle(
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(0)),
                ),
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
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.all(5),
                        width: 160,
                        height: 70,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(15)),
                        child: Container(
                            margin: EdgeInsets.all(2.7),
                            decoration: BoxDecoration(
                                color: playerActive
                                    ? Color.fromRGBO(0, 19, 81, 1)
                                    : Colors.white12,
                                borderRadius: BorderRadius.circular(15)),
                            child: Container(
                              margin: EdgeInsets.only(bottom: 7),
                              decoration: BoxDecoration(
                                  color: playerActive
                                      ? Color.fromRGBO(0, 88, 236, 1)
                                      : Colors.white24,
                                  border: Border.all(
                                      color: Colors.white38, width: 0.5),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    /* widget.icon != null ? widget.icon : Container(),
                        widget.icon != null
                          ? SizedBox(width: 10.0)
                          : Container(),*/
                                    Stack(
                                      children: <Widget>[
                                        Container(
                                            margin: EdgeInsets.all(5),
                                            height: 20,
                                            decoration: BoxDecoration(
                                                color: Color.fromRGBO(
                                                    85, 143, 242, 0.5),
                                                borderRadius:
                                                    BorderRadius.vertical(
                                                        top: Radius.circular(
                                                            15)))),
                                        Center(
                                          child: Text(
                                            "Azul " + paresPlayer1.toString(),
                                            style: TextStyle(
                                                height: 0.95,
                                                fontFamily: "Gamer",
                                                fontSize: 60,
                                                color: Color.fromRGBO(
                                                    35, 35, 35, 1)),
                                          ),
                                        ),
                                        Center(
                                          child: Text(
                                            "Azul " + paresPlayer1.toString(),
                                            style: TextStyle(
                                                fontFamily: "Gamer",
                                                fontSize: 60,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ))),
                    Container(
                        margin: EdgeInsets.all(5),
                        width: 160,
                        height: 70,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(15)),
                        child: Container(
                            margin: EdgeInsets.all(2.7),
                            decoration: BoxDecoration(
                                color: playerActive
                                    ? Colors.white12
                                    : Color.fromRGBO(165, 4, 33, 1),
                                borderRadius: BorderRadius.circular(15)),
                            child: Container(
                              margin: EdgeInsets.only(bottom: 7),
                              decoration: BoxDecoration(
                                  color: playerActive
                                      ? Colors.white24
                                      : Color.fromRGBO(241, 6, 49, 1),
                                  border: Border.all(
                                      color: Colors.white38, width: 0.5),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    /* widget.icon != null ? widget.icon : Container(),
                        widget.icon != null
                          ? SizedBox(width: 10.0)
                          : Container(),*/
                                    Stack(
                                      children: <Widget>[
                                        Container(
                                            margin: EdgeInsets.all(5),
                                            height: 20,
                                            decoration: BoxDecoration(
                                                color: Color.fromRGBO(
                                                    85, 143, 242, 0.5),
                                                borderRadius:
                                                    BorderRadius.vertical(
                                                        top: Radius.circular(
                                                            15)))),
                                        Center(
                                          child: Text(
                                            "Rojo " + paresPlayer2.toString(),
                                            style: TextStyle(
                                                height: 0.95,
                                                fontFamily: "Gamer",
                                                fontSize: 60,
                                                color: Color.fromRGBO(
                                                    35, 35, 35, 1)),
                                          ),
                                        ),
                                        Center(
                                          child: Text(
                                            "Rojo " + paresPlayer2.toString(),
                                            style: TextStyle(
                                                fontFamily: "Gamer",
                                                fontSize: 60,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ))),
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
    bool change = false;
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
            paresPlayer1++;
          } else {
            paresPlayer2++;
          }
          change = true;
          combo++;
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
      if (!change) playerActive = !playerActive;
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

  _endGame() async {
    if (pares == globalIndex) {
      await Future.delayed(const Duration(milliseconds: 500), () {});
      _taparCartas();
      await Future.delayed(const Duration(seconds: 1), () {});
      Dialogs.alertWin(context,
          title: "EL Juego Ha Finalizado",
          message: paresPlayer1 > paresPlayer2
              ? "El Ganador es el \njugador Azul"
              : paresPlayer1 == paresPlayer2
                  ? "Esto es un empate"
                  : "El Ganador es el \njugador Rojo",
          starValue: stars, onContinue: () {
        setState(() {
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
}
