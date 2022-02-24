import 'package:demogame/utils/botonGamer.dart';
import 'package:flutter/material.dart';

class ModoJuegoRapido extends StatefulWidget {
  @override
  _ModoJuegoRapidoState createState() => _ModoJuegoRapidoState();
}

class _ModoJuegoRapidoState extends State<ModoJuegoRapido> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new PreferredSize(
          child: Container(), preferredSize: Size.fromHeight(0)),
      body: Center(
        child: Container(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _boton("cardsgame", "2x3", 2, 3),
                  SizedBox(width: 10.0),
                  _boton("cardsgame", "3x4", 3, 4),
                ],
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _boton("cardsgame", "4x5", 4, 5),
                  SizedBox(width: 10.0),
                  _boton("cardsgame", "5x6", 5, 6),
                ],
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _boton("cardsgame", "7x8", 7, 8),
                  SizedBox(width: 10.0),
                  _boton("cardsgame", "8x9", 8, 9),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _boton(String screen, String text, int ancho, int largo) {
    return Container(
      child: BotonGamer(
        text: text,
        textSize: 70,
        colorCapa1: Color.fromRGBO(0, 19, 81, 1),
        colorCapa2: Color.fromRGBO(0, 52, 176, 1),
        colorCapa3: Color.fromRGBO(0, 88, 236, 1),
        colorCapa4: Color.fromRGBO(85, 143, 242, 0.5),
        borderSize: 10,
        onPressed: () {
          Navigator.pushNamed(context, screen, arguments: {
            'ancho': ancho,
            'largo': largo,
            'nivel': -1,
          });
        },
        icon: Container(
            width: 50,
            height: 45,
            child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage("assets/image/icons/card_icon.png"))))),
      ),
    );
  }
}
