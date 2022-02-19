import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimationsComments extends StatelessWidget {
  final String text;

  AnimationsComments(this.text) {}

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _CuadradoAnimations(text),
    );
  }
}

class _CuadradoAnimations extends StatefulWidget {
  final String text;

  _CuadradoAnimations(this.text) {}
  @override
  __CuadradoAnimationsState createState() => __CuadradoAnimationsState();
}

class __CuadradoAnimationsState extends State<_CuadradoAnimations>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scale;
  Animation<double> opacityOut;

  @override
  void initState() {
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 500));
    scale = Tween(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.linear));
    opacityOut = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.75, 1.0, curve: Curves.linear)));
    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        //controller.repeat();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return AnimatedBuilder(
      animation: controller,
      child: _Cuadrado(widget.text),
      builder: (BuildContext context, Widget child) {
        return Transform.scale(
          scale: scale.value,
          child: Opacity(opacity: opacityOut.value, child: child),
        );
      },
    );
  }
}

class _Cuadrado extends StatelessWidget {
  final String text;
  _Cuadrado(this.text) {}
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
            children: <Widget>[
              Container(
                  child: Text(
                text,
                style: TextStyle(
                    color: Color.fromRGBO(190, 145, 0, 1),
                    fontSize: 70,
                    fontFamily: "Gamer",
                    height: 0.90),
                textAlign: TextAlign.center,
              )),
              Container(
                  child: Text(
                    text,
                    style: TextStyle(
                        color: Colors.yellowAccent,
                        fontSize: 70,
                        fontFamily: "Gamer"),
                    textAlign: TextAlign.center,
                  )),
            ],
          ),
    );
  }
}
