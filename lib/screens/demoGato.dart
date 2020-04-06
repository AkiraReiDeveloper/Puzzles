import 'package:demogame/utils/botonGamer.dart';
import 'package:demogame/utils/dialogs.dart';
import 'package:demogame/utils/sounds.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DemoGato extends StatefulWidget {
  @override
  _DemoGatoState createState() => _DemoGatoState();
}

class _DemoGatoState extends State<DemoGato> {
  
  Sounds soundsEffects = new Sounds();
  String player1Wins = "";
  String player2Wins = "";
  String player1;
  String player2;
  Color player1Color;
  Color player2Color;
  int numPlayer1 = 0;
  int numPlayer2 = 0;
  bool isSelected = false;
  static Color colorDiseable = Color.fromRGBO(50, 50, 50, 1);
  List<Widget> wingsMarkersO = [];
  List<Widget> wingsMarkersX = [];
  List<bool> listaIsSelected = [];
  List<String> listaString = [];
  List<Color> colors = [];
  bool iterate = false;
  bool fichaIsSelected = false;
  bool playGame = false;
  bool reiniciarBoton = false;

  

  @override
  void initState() {
    // TODO: implement initState
    //playSongofScreen();
    resetValues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //soundsEffects.playLocalMusic("music/mouse_click_sound_effect.mp3");
    return Scaffold(
        appBar: new PreferredSize(
            child: Container(), preferredSize: Size.fromHeight(0)),
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Center(
                child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        Color.fromRGBO(0, 163, 0, 0.5), BlendMode.color),
                    fit: BoxFit.fill,
                    image: AssetImage(
                      "assets/image/background/background_mosaico.png",
                    )),
              ),
              child: Column(
                children: <Widget>[
                  barToVictorius(wingsMarkersO, wingsMarkersX),
                  Expanded(
                    child: Container(child: gatoGame()),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10),
                          child: BotonGamer(
                              text: "Reiniciar",
                              textSize: 42,
                              colorCapa1: Color.fromRGBO(0, 19, 81, 1),
                              colorCapa2: Color.fromRGBO(0, 52, 176, 1),
                              colorCapa3: Color.fromRGBO(0, 88, 236, 1),
                              colorCapa4: Color.fromRGBO(85, 143, 242, 0.5),
                              borderSize: 10,
                              onPressed: () {
                                setState(() {
                                  soundsEffects.playLocalEffects("music/switch38.wav");
                                  reiniciarBoton = true;
                                  resetValues();
                                });
                              }),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: !fichaIsSelected
                              ? BotonGamer(
                                  text: "Ficha",
                                  colorCapa1: Color.fromRGBO(5, 52, 0, 1),
                                  colorCapa2: Color.fromRGBO(7, 102, 0, 1),
                                  colorCapa3: Color.fromRGBO(12, 163, 0, 1),
                                  colorCapa4: Color.fromRGBO(44, 176, 28, 0.5),
                                  borderSize: 10,
                                  onPressed: () {
                                    soundsEffects.playLocalEffects("music/switch38.wav");
                                    Dialogs.fichaCatSelected(context,
                                        title: "Player 1",
                                        message: "¡Selecciona tu ficha!",
                                        onConfirmO: () {
                                      setState(() {
                                        player1 = "O";
                                        player2 = "X";
                                        player1Color =
                                            Color.fromRGBO(0, 163, 0, 1);
                                        player2Color =
                                            Color.fromRGBO(0, 89, 236, 1);
                                        Navigator.of(context).pop();
                                        fichaIsSelected = true;
                                        soundsEffects.playLocalEffects("music/switch38.wav");
                                      });
                                    }, onConfirmX: () {
                                      setState(() {
                                        player1 = "X";
                                        player2 = "O";
                                        player1Color =
                                            Color.fromRGBO(0, 89, 236, 1);
                                        player2Color =
                                            Color.fromRGBO(0, 163, 0, 1);
                                        Navigator.of(context).pop();
                                        fichaIsSelected = true;
                                        soundsEffects.playLocalEffects("music/switch38.wav");
                                      });
                                    });
                                  })
                              : BotonGamer(
                                  text: "ficha",
                                  borderSize: 10,
                                  onPressed: () {}),
                        ),
                      ])
                ],
              ),
            )),
          ],
        ));
  }

  Widget gatoGame() {
    return Container(
      margin: EdgeInsets.all(10),
      child: GridView.count(
        crossAxisSpacing: 10,
        crossAxisCount: 3,
        children: List.generate(9, (index) {
          return Center(
              child: Container(
            constraints: BoxConstraints.expand(),
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: colors.elementAt(index),
                borderRadius: BorderRadius.all(Radius.circular(5)),
                border: Border.all(color: Colors.white, width: 3)),
            child: RaisedButton(
              color: Colors.transparent,
              onPressed: () => _onClick(index),
              child: Container(
                child: Text(
                  listaString[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 80,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ));
        }),
      ),
    );
  }

  Widget markerWinBar(Color color) {
    return new Container(
      width: 20,
      height: 20,
      margin: EdgeInsets.only(top: 10, left: 5, right: 5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(color: Colors.white, width: 3),
      ),
    );
  }

  Widget barToVictorius(List<Widget> markersX, List<Widget> markersO) {
    var width = MediaQuery.of(context).size.width;
    return new Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(30, 30, 30, 1),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(5)),
      ),
      width: width,
      child: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.only(bottom: 2),
          decoration: BoxDecoration(
            color: Color.fromRGBO(30, 30, 30, 1),
          ),
          child: Stack(
            children: <Widget>[
              Container(
                  child: Text(
                "Victorias",
                style: TextStyle(
                    color: Color.fromRGBO(190, 145, 0, 1),
                    fontSize: 50,
                    fontFamily: "Gamer",
                    height: 0.90),
                textAlign: TextAlign.center,
              )),
              Container(
                  width: width,
                  color: Color.fromRGBO(34, 34, 34, 1),
                  child: Text(
                    "Victorias",
                    style: TextStyle(
                        color: Colors.yellowAccent,
                        fontSize: 50,
                        fontFamily: "Gamer"),
                    textAlign: TextAlign.center,
                  )),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(5)),
            color: Color.fromRGBO(51, 51, 51, 1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      player2 != null ? player2 : "-",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Gamer",
                          fontSize: 70),
                    ),
                  ),
                  Row(children: markersX),
                ],
              ),
              Row(
                textDirection: TextDirection.rtl,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      player1 != null ? player1 : "-",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Gamer",
                          fontSize: 70),
                    ),
                  ),
                  Row(children: markersO),
                ],
              ),
            ],
          ),
        )
      ]),
    );
  }

  combinaciones() {
    combinacionRenglon();
    combinacionColumna();
    combinacionDiagonal();
  }

  _onClick(int index) {
    setState(() {
      if (fichaIsSelected) {
        if (!listaIsSelected[index]) {
          if (!iterate) {
            listaString[index] = player1;
            iterate = true;
            player1Wins = player1Wins + index.toString();
            colors[index] = player1Color;
          } else {
            listaString[index] = player2;
            iterate = false;
            player2Wins = player2Wins + index.toString();
            colors[index] = player2Color;
          }
          listaIsSelected[index] = true;
        }
      } else {
        Dialogs.alertWin(context, title: "Debes Seleccionar una Ficha");
      }
    });

    combinaciones();
  }

  combinacionRenglon() {
    if (player1Wins.indexOf("0") != -1 &&
            player1Wins.indexOf("1") != -1 &&
            player1Wins.indexOf("2") != -1 ||
        player1Wins.indexOf("3") != -1 &&
            player1Wins.indexOf("4") != -1 &&
            player1Wins.indexOf("5") != -1 ||
        player1Wins.indexOf("6") != -1 &&
            player1Wins.indexOf("7") != -1 &&
            player1Wins.indexOf("8") != -1) {
      setState(() {
        iterate = true;
        numPlayer1 += 1;
        if (numPlayer1 < 5) {
          wingsMarkersX[numPlayer1 - 1] = markerWinBar(player1Color);
        }
        resetValues();
      });
    } else {
      if (player2Wins.indexOf("0") != -1 &&
              player2Wins.indexOf("1") != -1 &&
              player2Wins.indexOf("2") != -1 ||
          player2Wins.indexOf("3") != -1 &&
              player2Wins.indexOf("4") != -1 &&
              player2Wins.indexOf("5") != -1 ||
          player2Wins.indexOf("6") != -1 &&
              player2Wins.indexOf("7") != -1 &&
              player2Wins.indexOf("8") != -1) {
        setState(() {
          iterate = false;
          numPlayer2 += 1;
          if (numPlayer2 < 5) {
            wingsMarkersO[numPlayer2 - 1] = markerWinBar(player2Color);
          }
          resetValues();
        });
      }
    }
  }

  combinacionColumna() {
    if (player1Wins.indexOf("0") != -1 &&
            player1Wins.indexOf("3") != -1 &&
            player1Wins.indexOf("6") != -1 ||
        player1Wins.indexOf("1") != -1 &&
            player1Wins.indexOf("4") != -1 &&
            player1Wins.indexOf("7") != -1 ||
        player1Wins.indexOf("2") != -1 &&
            player1Wins.indexOf("5") != -1 &&
            player1Wins.indexOf("8") != -1) {
      setState(() {
        iterate = true;
        numPlayer1 += 1;
        if (numPlayer1 < 5) {
          wingsMarkersX[numPlayer1 - 1] = markerWinBar(player1Color);
        }
        resetValues();
      });
    } else {
      if (player2Wins.indexOf("0") != -1 &&
              player2Wins.indexOf("3") != -1 &&
              player2Wins.indexOf("6") != -1 ||
          player2Wins.indexOf("1") != -1 &&
              player2Wins.indexOf("4") != -1 &&
              player2Wins.indexOf("7") != -1 ||
          player2Wins.indexOf("2") != -1 &&
              player2Wins.indexOf("5") != -1 &&
              player2Wins.indexOf("8") != -1) {
        setState(() {
          iterate = false;
          numPlayer2 += 1;
          if (numPlayer2 < 5) {
            wingsMarkersO[numPlayer2 - 1] = markerWinBar(player2Color);
          }
          resetValues();
        });
      }
    }
  }

  combinacionDiagonal() {
    if (player1Wins.indexOf("0") != -1 &&
            player1Wins.indexOf("4") != -1 &&
            player1Wins.indexOf("8") != -1 ||
        player1Wins.indexOf("2") != -1 &&
            player1Wins.indexOf("4") != -1 &&
            player1Wins.indexOf("6") != -1) {
      setState(() {
        iterate = true;
        numPlayer1 += 1;
        if (numPlayer1 < 5) {
          wingsMarkersX[numPlayer1 - 1] = markerWinBar(player1Color);
        }
        resetValues();
      });
    } else {
      if (player2Wins.indexOf("0") != -1 &&
              player2Wins.indexOf("4") != -1 &&
              player2Wins.indexOf("8") != -1 ||
          player2Wins.indexOf("2") != -1 &&
              player2Wins.indexOf("4") != -1 &&
              player2Wins.indexOf("6") != -1) {
        setState(() {
          iterate = false;
          numPlayer2 += 1;
          if (numPlayer2 < 5) {
            wingsMarkersO[numPlayer2 - 1] = markerWinBar(player2Color);
          }
          resetValues();
        });
      }
    }
  }

  resetValues() {
    player1Wins = "";
    player2Wins = "";
    listaIsSelected = [
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false
    ];
    colors = [
      colorDiseable,
      colorDiseable,
      colorDiseable,
      colorDiseable,
      colorDiseable,
      colorDiseable,
      colorDiseable,
      colorDiseable,
      colorDiseable
    ];
    listaString = ["", "", "", "", "", "", "", "", ""];

    //iterate = false;
    if (numPlayer1 + numPlayer2 == 8 || numPlayer1 == 5 || numPlayer2 == 5) {
      if (numPlayer1 > numPlayer2) {
        Dialogs.alertWin(context,
            title: "El jugador " + player1 + " es el ganador");
      } else {
        if (numPlayer1 == numPlayer2) {
          Dialogs.alertWin(context, title: "Esto es un empate");
        } else {
          Dialogs.alertWin(context,
              title: "El jugador " + player2 + " es el ganador");
        }
      }
      numPlayer1 = 0;
      numPlayer2 = 0;
      fichaIsSelected = false;
      playGame = false;
    }
    if (fichaIsSelected && !reiniciarBoton) {
      if (iterate) {
        Dialogs.alertWin(context,
            title: "El siguiente turno es para el jugador " + player2);
      } else {
        Dialogs.alertWin(context,
            title: "El siguiente turno es para el jugador " + player1);
      }
    }
    if (!playGame) {
      wingsMarkersX = [
        markerWinBar(Colors.grey),
        markerWinBar(Colors.grey),
        markerWinBar(Colors.grey),
        markerWinBar(Colors.grey),
      ];
      wingsMarkersO = [
        markerWinBar(Colors.grey),
        markerWinBar(Colors.grey),
        markerWinBar(Colors.grey),
        markerWinBar(Colors.grey),
      ];
      playGame = true;
    }
    reiniciarBoton = false;
  }
}
