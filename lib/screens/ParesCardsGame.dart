import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ParesCardsGame extends StatefulWidget {
  @override
  _ParesCardsGameState createState() => _ParesCardsGameState();
}

class _ParesCardsGameState extends State<ParesCardsGame> {
  Widget cardAnimated = FlareActor("assets/animations/card_joker.flr",
      alignment: Alignment.center,
      fit: BoxFit.fill,
      animation: "joker_reaction");

  Color color = Colors.grey;
  bool isSelected = false;
  final List<bool> listaSelected = [];
  final List<bool> disabled = [];
  final List<Widget> listaWidget = [];
  String valor = "";
  List<Color> colors = [];
  bool iterate = false;
  String locationInfo = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new PreferredSize(
            child: Container(), preferredSize: Size.fromHeight(0)),
        body: Stack(
          children: <Widget>[
            Center(
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
              children: <Widget>[
                  Expanded(
                    child: Container(
                      child: cardList(),
                    ),
                  ),
              ],
            ),
                )),
          ],
        ));
  }

  Widget cardList() {
    return Container(
      margin: EdgeInsets.all(10),
      child: GridView.count(
        crossAxisSpacing: 4,
        crossAxisCount: 5,
        childAspectRatio: (100 / 130),
        children: List.generate(30, (index) {
          return Center(
              child: Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(5)),
                border: Border.all(color: Colors.white, width: 3)),
            child: RaisedButton(
                padding: EdgeInsets.all(0),
                color: Colors.transparent,
                onPressed: () => _onClick(index),
                child: cardAnimated),
          ));
        }),
      ),
    );
  }

  _onClick(int index) {
    setState(() {
      cardAnimated = FlareActor("assets/animations/card_joker.flr",
          alignment: Alignment.center,
          fit: BoxFit.fill,
          animation: "card_animation");
    });
  }
}
