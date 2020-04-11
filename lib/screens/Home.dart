import 'package:demogame/utils/botonGamer.dart';
import 'package:demogame/utils/dialogs.dart';
import 'package:demogame/utils/noteBook.dart';
import 'package:demogame/utils/sounds.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Sounds soundsEffects = new Sounds();

  @override
  void setState(fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    //soundsEffects.playLocalMusic("music/and_i_love_her.mid");
    return Scaffold(
      body: Center(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Color.fromRGBO(0, 89, 236, 0.5), BlendMode.color),
                  fit: BoxFit.fill,
                  image: AssetImage(
                    "assets/image/background/background_mosaico.png",
                  )),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: BotonGamer(
                    text: "Gato",
                    colorCapa1: Color.fromRGBO(0, 19, 81, 1),
                    colorCapa2: Color.fromRGBO(0, 52, 176, 1),
                    colorCapa3: Color.fromRGBO(0, 88, 236, 1),
                    colorCapa4: Color.fromRGBO(85, 143, 242, 0.5),
                    borderSize: 10,
                    onPressed: () {
                      Navigator.pushNamed(context, "gatogame");
                    },
                    icon: Container(
                      width: 50,
                      height: 45,
                      child: FlareActor("assets/animations/gatogame.flr",
                          shouldClip: false,
                          alignment: Alignment.center,
                          fit: BoxFit.fill,
                          animation: "gato_example"),
                    ),
                  ),
                ),
                Container(
                  child: BotonGamer(
                    text: "Pares",
                    colorCapa1: Color.fromRGBO(0, 19, 81, 1),
                    colorCapa2: Color.fromRGBO(0, 52, 176, 1),
                    colorCapa3: Color.fromRGBO(0, 88, 236, 1),
                    colorCapa4: Color.fromRGBO(85, 143, 242, 0.5),
                    borderSize: 10,
                    onPressed: () {
                      Navigator.pushNamed(context, "juegorapido");
                    },
                    icon: Container(
                      width: 35,
                      height: 50,
                      child: FlareActor("assets/animations/card_joker.flr",
                          shouldClip: false,
                          alignment: Alignment.center,
                          fit: BoxFit.fill,
                          animation: "joker_reaction_left"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
/*
  Widget _selectedGame({VoidCallback onSelected, FlareActor animation}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        NoteBook.noteBook(
          Container(constraints: BoxConstraints.expand(), child: animation),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BotonGamer(
                  text: "Iniciar",
                  colorCapa1: Color.fromRGBO(237, 166, 0, 1),
                  colorCapa2: Color.fromRGBO(255, 200, 0, 1),
                  colorCapa3: Color.fromRGBO(255, 219, 0, 1),
                  colorCapa4: Color.fromRGBO(251, 232, 85, 0.5),
                  borderSize: 10,
                  onPressed: onSelected),
              /*BotonGamer(
                text: "¡Información!",
                colorCapa1: Color.fromRGBO(0, 19, 81, 1),
                colorCapa2: Color.fromRGBO(0, 52, 176, 1),
                colorCapa3: Color.fromRGBO(0, 88, 236, 1),
                colorCapa4: Color.fromRGBO(85, 143, 242, 0.5),
                borderSize: 10,
                textSize: 30,
                onPressed: () {
                  Dialogs.alert(context,
                      title: "¡Información!",
                      message:
                          "Este juego está en fase de demostración por lo tanto podría tener algunos errores. \nCon el paso de los días otros puzzles serán agregados.");
                },
              ),*/
            ],
          ),
        ),
      ],
    );
  }*/
}
