import 'package:demogame/utils/animated_card_background.dart';
import 'package:demogame/utils/animations_comments.dart';
import 'package:demogame/utils/botonGamer.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:demogame/utils/userPreferences.dart';
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
  //Sounds soundsEffects = new Sounds();
  UserPreferences userPreferences = new UserPreferences();
  bool musicOn = true;

  @override
  void initState() {
    //soundsEffects.playLocalMusic("music/and_i_love_her.mid");
    //_initialPreferences();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> playAudio() async {
    final player = AudioPlayer();
    await player.setSourceAsset('assets/music/mouse_click_sound_effect.mp3');
    await player.play;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromRGBO(0, 37, 173, 1),
                  Color.fromRGBO(1, 23, 107, 1),
                  Color.fromRGBO(0, 17, 85, 1),
                  Color.fromRGBO(1, 13, 62, 1),
                ],
                stops: [0.0, 0.25, 0.5, 0.75],
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Animations(),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    padding: EdgeInsets.only(top: 80),
                    child: Stack(
                      children: <Widget>[
                        Container(
                            child: Text(
                          "Puzzles",
                          style: TextStyle(
                              color: Color.fromRGBO(190, 145, 0, 1),
                              fontSize: 90,
                              fontFamily: "Gamer",
                              height: .95),
                          textAlign: TextAlign.center,
                        )),
                        Container(
                            child: Text(
                          "Puzzles",
                          style: TextStyle(
                              color: Colors.yellowAccent,
                              fontSize: 90,
                              fontFamily: "Gamer"),
                          textAlign: TextAlign.center,
                        )),
                      ],
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: BotonGamer(
                        text: "Tres en linea",
                        colorCapa1: Color.fromRGBO(0, 19, 81, 1),
                        colorCapa2: Color.fromRGBO(0, 52, 176, 1),
                        colorCapa3: Color.fromRGBO(0, 88, 236, 1),
                        colorCapa4: Color.fromRGBO(85, 143, 242, 0.5),
                        borderSize: 10,
                        width: MediaQuery.of(context).size.width - 100,
                        onPressed: () {
                          playAudio();
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
                    SizedBox(height: 10.0),
                    Container(
                      child: BotonGamer(
                        text: "Pares",
                        colorCapa1: Color.fromRGBO(0, 19, 81, 1),
                        colorCapa2: Color.fromRGBO(0, 52, 176, 1),
                        colorCapa3: Color.fromRGBO(0, 88, 236, 1),
                        colorCapa4: Color.fromRGBO(85, 143, 242, 0.5),
                        borderSize: 10,
                        width: MediaQuery.of(context).size.width - 100,
                        onPressed: () {
                          Navigator.pushNamed(context, "cardsgamemode");
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
                Align(
                  alignment: Alignment.bottomLeft,
                  child: GestureDetector(
                    onTap: () {
                      if (musicOn) {
                        //soundsEffects.stopLocalMusic();
                        musicOn = false;
                      } else {
                        //soundsEffects.playLocalMusic("music/and_i_love_her.mid");
                        musicOn = true;
                      }
                      setState(() {});
                    },
                    child: Container(
                        child: !musicOn
                            ? Icon(
                                Icons.volume_off,
                                size: 40,
                                color: Colors.white,
                              )
                            : Icon(
                                Icons.volume_up,
                                size: 40,
                                color: Colors.white,
                              )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _initialPreferences() {
    setState(() {
      if (userPreferences.gameStart == false) {
        userPreferences.gameStart = true;
        userPreferences.levelsDisabled = List.filled(100, "false");
        userPreferences.levelsDisabled[1] = "true";
        userPreferences.stars = List.filled(100, "0");
        userPreferences.totalStars = 0;
        print("Entro");
      }
    });
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
