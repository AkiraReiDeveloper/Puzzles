import 'package:demogame/utils/botonGamer.dart';
import 'package:demogame/utils/dialogs.dart';
import 'package:demogame/utils/sounds.dart';
import 'package:flutter/material.dart';

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
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: ColorFilter.mode(Color.fromRGBO(0, 89, 236, 0.5),  BlendMode.color),
                  fit: BoxFit.fill,
                  image: AssetImage(
                    "assets/image/background/background_mosaico.png",
                  )),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    BotonGamer(
                      text: "Iniciar",
                      colorCapa1: Color.fromRGBO(237, 166, 0, 1),
                      colorCapa2: Color.fromRGBO(255, 206, 0, 1),
                      colorCapa3: Color.fromRGBO(250, 229, 0, 1),
                      colorCapa4: Color.fromRGBO(251, 237, 85, 0.5),
                      borderSize: 10,
                      onPressed: () {
                        Navigator.pushNamed(context, "demogato");
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    BotonGamer(
                      text: "¡Fiesta!",
                      colorCapa1: Color.fromRGBO(0, 19, 81, 1),
                      colorCapa2: Color.fromRGBO(0, 52, 176, 1),
                      colorCapa3: Color.fromRGBO(0, 88, 236, 1),
                      colorCapa4: Color.fromRGBO(85, 143, 242, 0.5),
                      borderSize: 10,
                      onPressed: () {
                        /*if (_controllerA.isCompleted) {
                          _controllerA.reverse();
                        } else {
                          _controllerA.forward(from: 0.0);
                        }*/
                        Dialogs.alert(context,
                            title: "¡Fiesta!",
                            message:
                                "Este es el mensaje Este es el mensaje Este es el mensaje Este es el mensaje Este es el mensaje Este es el mensaje Este es el mensaje Este es el mensaje ");
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
