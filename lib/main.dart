import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_01/screens/loading.dart';
import 'package:pokedex_01/screens/home.dart';

void main() {

  ErrorWidget.builder = (FlutterErrorDetails error) {
    bool inDebug = false;
    assert(() {
      inDebug = true;
      return true;
    } ());
    if (inDebug)
      return ErrorWidget(error.exception);

    return Container(
      alignment: Alignment.center,
      child: Text(
        'Error',
        style: TextStyle(
          color: Colors.amber,
        ),
        textDirection: TextDirection.ltr,
      ),
    );
  };

  return runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => HomeScreen()
    },
  ));
}
