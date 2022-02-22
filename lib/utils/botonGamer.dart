import 'package:flutter/material.dart';

class BotonGamer extends StatefulWidget {
  final String text;
  final double textSize;
  final Color colorCapa0;
  final Color colorCapa1;
  final Color colorCapa2;
  final Color colorCapa3;
  final Color colorCapa4;
  final VoidCallback onPressed;
  final double borderSize;
  final double width;
  final double height;
  final Color textColor;
  final Widget icon;

  BotonGamer(
      {@required this.text,
      this.textSize = 45,
      this.colorCapa0 = Colors.black,
      this.colorCapa1 = Colors.white10,
      this.colorCapa2 = Colors.white12,
      this.colorCapa3 = Colors.white24,
      this.colorCapa4 = Colors.white30,
      this.width = 150.0,
      this.height = 90.0,
      @required this.onPressed,
      this.borderSize = 15,
      this.textColor = Colors.white,
      this.icon});

  @override
  _BotonGamerState createState() => _BotonGamerState();
}

class _BotonGamerState extends State<BotonGamer> with TickerProviderStateMixin {
  var squareScaleA = 1.0;

  AnimationController _controllerA;

  @override
  void initState() {
    _controllerA = AnimationController(
        vsync: this,
        lowerBound: 0.90,
        upperBound: 1.0,
        duration: Duration(microseconds: 1000));
    _controllerA.addListener(() {
      setState(() {
        squareScaleA = _controllerA.value;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controllerA.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: new Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
              color: widget.colorCapa0,
              borderRadius: BorderRadius.circular(widget.borderSize)),
          child: Container(
              margin: EdgeInsets.only(bottom: 2),
              decoration: BoxDecoration(
                  color: widget.colorCapa1,
                  borderRadius: BorderRadius.circular(widget.borderSize)),
              child: Container(
                margin: EdgeInsets.only(bottom: 6),
                decoration: BoxDecoration(
                    color: widget.colorCapa2,
                    border: Border.all(color: Colors.white38, width: 0.5),
                    borderRadius: BorderRadius.circular(widget.borderSize)),
                child: Container(
                    margin: EdgeInsets.all(2.7),
                    decoration: BoxDecoration(
                        color: widget.colorCapa1,
                        borderRadius: BorderRadius.circular(widget.borderSize)),
                    child: Container(
                      margin: EdgeInsets.only(bottom: 3),
                      decoration: BoxDecoration(
                          color: widget.colorCapa3,
                          border: Border.all(color: Colors.white38, width: 0.5),
                          borderRadius:
                              BorderRadius.circular(widget.borderSize)),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            widget.icon != null ? widget.icon : Container(),
                            widget.icon != null
                                ? SizedBox(width: 10.0)
                                : Container(),
                            Stack(
                              children: <Widget>[
                                Container(
                                    margin: EdgeInsets.all(5),
                                    height: 20,
                                    decoration: BoxDecoration(
                                        color: widget.colorCapa4,
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(
                                                widget.borderSize)))),
                                Center(
                                  child: Text(
                                    widget.text,
                                    style: TextStyle(
                                        height: 0.95,
                                        fontFamily: "Gamer",
                                        fontSize: widget.textSize,
                                        color: Color.fromRGBO(35, 35, 35, 1)),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    widget.text,
                                    style: TextStyle(
                                        fontFamily: "Gamer",
                                        fontSize: widget.textSize,
                                        color: widget.textColor),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )),
              ))),
    );
  }
}
