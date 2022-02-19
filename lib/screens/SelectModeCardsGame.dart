import 'package:demogame/utils/botonGamer.dart';
import 'package:flutter/material.dart';

class SelectModeCardsGame extends StatefulWidget {
  @override
  _SelectModeCardsGameState createState() => _SelectModeCardsGameState();
}

class _SelectModeCardsGameState extends State<SelectModeCardsGame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new PreferredSize(
          child: Container(), preferredSize: Size.fromHeight(0)),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _boton("modohistoria", "Historia", 250, 50),
              SizedBox(height: 10.0),
              _boton("juegorapido", "Juego rápido", 250, 50),
              SizedBox(height: 10.0),
              _boton("pvp", "PVP", 250, 50),
            ],
          ),
        ),
      ),
    );
  }

  Widget _boton(String screen, String text, double width, double fontSize) {
    return Container(
      child: BotonGamer(
        text: text,
        textSize: fontSize,
        colorCapa1: Color.fromRGBO(0, 19, 81, 1),
        colorCapa2: Color.fromRGBO(0, 52, 176, 1),
        colorCapa3: Color.fromRGBO(0, 88, 236, 1),
        colorCapa4: Color.fromRGBO(85, 143, 242, 0.5),
        borderSize: 10,
        width: width,
        onPressed: () {
          Navigator.pushNamed(
            context,
            screen,
          );
        },
      ),
    );
  }
}
