import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'dart:math' as Math;

class Animations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double endScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: <Widget>[
          _animatedFigure(10000, endScreen, Alignment.topLeft, true,
              Color.fromRGBO(0, 163, 0, 1)),
          _animatedFigure(8000, endScreen, Alignment.topCenter, true,
              Color.fromRGBO(0, 163, 0, 1)),
          _animatedFigure(4000, endScreen, Alignment.topRight, true,
              Color.fromRGBO(0, 163, 0, 1)),
          _animatedFigure(6000, endScreen, Alignment.topLeft, false,
              Color.fromRGBO(0, 89, 236, 1)),
          _animatedFigure(7000, endScreen, Alignment.topCenter, false,
              Color.fromRGBO(0, 89, 236, 1)),
          _animatedFigure(9000, endScreen, Alignment.topRight, false,
              Color.fromRGBO(0, 89, 236, 1)),
          _animatedCard(7000, endScreen, Alignment.topLeft),
          _animatedCard(5000, endScreen, Alignment.topCenter),
          _animatedCard(6000, endScreen, Alignment.topRight),
          _animatedCard(8000, endScreen, Alignment.topLeft),
          _animatedCard(10000, endScreen, Alignment.topCenter),
          _animatedCard(7000, endScreen, Alignment.topRight),
        ],
      ),
    );
  }
}

Widget _animatedCard(int duration, double endScreen, Alignment alignment) {
  return Align(
      alignment: alignment, child: _CuadradoAnimations(duration, endScreen));
}

Widget _animatedFigure(int duration, double endScreen, Alignment alignment,
    bool circle, Color color) {
  return Align(
      alignment: alignment,
      child: _CuadradoAnimations(
        duration,
        endScreen,
        widget: FlareActor(
          circle
              ? "assets/animations/circle_animated.flr"
              : "assets/animations/cross_animated.flr",
          alignment: Alignment.center,
          fit: BoxFit.contain,
          color: color,
        ),
      ));
}

class _CuadradoAnimations extends StatefulWidget {
  final int durationMilliseconds;
  final double endScreen;
  Widget? widget;

  _CuadradoAnimations(this.durationMilliseconds, this.endScreen,
      {this.widget}) {}
  @override
  __CuadradoAnimationsState createState() => __CuadradoAnimationsState();
}

class __CuadradoAnimationsState extends State<_CuadradoAnimations>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? rotation;
  Animation<double>? opacity;
  Animation<double>? opacityOut;
  Animation<double>? moveRight;
  Animation<double>? scale;

  @override
  void initState() {
    controller = new AnimationController(
        vsync: this,
        duration: Duration(milliseconds: widget.durationMilliseconds));
    rotation = Tween(begin: 0.0, end: 4 * Math.pi)
        .animate(CurvedAnimation(parent: controller!, curve: Curves.linear));
    moveRight = Tween(begin: -200.0, end: widget.endScreen)
        .animate(CurvedAnimation(parent: controller!, curve: Curves.linear));
    controller!.addListener(() {
      if (controller!.status == AnimationStatus.completed) {
        controller!.repeat();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller!.forward();
    return AnimatedBuilder(
      animation: controller!,
      child: _Cuadrado(widget.widget!),
      builder: (BuildContext? context, Widget? child) {
        return Transform.translate(
          offset: Offset(0, moveRight!.value),
          child: Transform.rotate(angle: rotation!.value, child: child),
        );
      },
    );
  }
}

class _Cuadrado extends StatelessWidget {
  final Widget widget;
  _Cuadrado(this.widget) {}
  @override
  Widget build(BuildContext context) {
    return widget == null
        ? Container(
            width: 100,
            height: 130,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/image/icons/card_icon.png"))),
          )
        : Container(width: 150, height: 150, child: widget);
  }
}
