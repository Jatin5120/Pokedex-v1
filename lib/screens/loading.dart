import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  static const String url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  void gotoHome() async {
    print("Getting data from Json: ");
    Response response = await get(url);
    Map data = jsonDecode(response.body);
    await Future.delayed(Duration(seconds: 8));
    Navigator.pushReplacementNamed(context, '/home', arguments: data);
  }

  void initState() {
    super.initState();
    gotoHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blueGrey[300],
              Colors.blueGrey[400],
              Colors.blueGrey[600],
              Colors.blueGrey[700],
              Colors.blueGrey[600],
            ],
            stops: [0.1, 0.3, 0.5, 0.7, 0.9],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  SpinKitDoubleBounce(
                    size: 120,
                    color: Colors.grey[400],
                    duration: Duration(milliseconds: 1500),
                  ),
                  SpinKitPulse(
                    size: 200,
                    color: Colors.grey[200],
                    duration: Duration(milliseconds: 3000),
                  ),
                  SpinKitDualRing(
                    size: 100,
                    lineWidth: 5,
                    color: Colors.amber[500],
                    duration: Duration(milliseconds: 2500),
                  ),
                  RotateImage(),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              SpinKitThreeBounce(
                size: 20,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RotateImage extends StatefulWidget {
  @override
  _RotateImageState createState() => _RotateImageState();
}

class _RotateImageState extends State<RotateImage>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  Future<void> stopRotate() async {
    await Future.delayed(Duration(seconds: 9));
    animationController.stop();
  }

  void initState() {
    super.initState();

    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 5),
    );

    animationController.repeat();
    stopRotate();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      child: AnimatedBuilder(
        animation: animationController,
        child: Image.asset(
          'images/pokeball.png',
          height: 50,
          width: 50,
        ),
        builder: (BuildContext context, Widget _widget) {
          return Transform.rotate(
            angle: animationController.value *(-6.3),
            child: _widget,
          );
        },
      ),
    );
  }
}
