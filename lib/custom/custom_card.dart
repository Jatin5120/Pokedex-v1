import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PokemonCard extends StatelessWidget {

  Image image;
  Text name;

  PokemonCard({this.image, this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromRGBO(255, 255, 255, 0.95),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Center(
          child: Column(
            children: <Widget>[
              image,
              SizedBox(height: 5,),
              name,
            ],
          ),
        ),
      ),
    );
  }
}
