import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PokemonDetails extends StatelessWidget {
  final Map pokemon;
  final TextStyle heightWeightStyle = TextStyle(
    color: Colors.grey[800],
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );
  final TextStyle subtopicStyle = TextStyle(
    color: Colors.grey[800],
    fontSize: 18,
    fontWeight: FontWeight.bold,
    letterSpacing: 1,
  );
  final SizedBox divider = SizedBox(height: 10);

  PokemonDetails({this.pokemon});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Hero(
        tag: pokemon['img'],
        child: Container(
          color: Colors.blue[200],
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Positioned(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width - 20,
                left: 10,
                top: MediaQuery.of(context).size.height * 0.15,
                child: Card(
                  elevation: 15,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 100,
                      ),
                      Text(
                        pokemon['name'],
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                      divider,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Height: ${pokemon['height']}",
                            style: heightWeightStyle,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Weight: ${pokemon['weight']}",
                            style: heightWeightStyle,
                          ),
                        ],
                      ),
                      divider,
                      Text(
                        'Types',
                        style: subtopicStyle,
                      ),
                      divider,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          for (var i in pokemon['type']) buildType(i),
                        ],
                      ),
                      divider,
                      Text(
                        'Weaknesses',
                        style: subtopicStyle,
                      ),
                      divider,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          for (var i in pokemon['weaknesses']) buildType(i),
                        ],
                      ),
                      divider,
                      Text(
                        'Previous Evolution',
                        style: subtopicStyle,
                      ),
                      divider,
                      pokemon['prev_evolution'] == null
                          ? Text(
                              'This is Initial Form, No Previous Evolution',
                              style: noEvolution(Color.fromRGBO(255, 100, 0, 1)),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                for (var i in pokemon['prev_evolution']) buildEvolve(i['name'], Color.fromRGBO(255, 0, 0, 1))
                              ],
                            ),
                      divider,
                      Text(
                        'Next Evolution',
                        style: subtopicStyle,
                      ),
                      divider,
                      pokemon['next_evolution'] == null
                          ? Text(
                        'This is Final Form, No Next Evolution',
                        style: noEvolution(Color.fromRGBO(0, 100, 255, 1)),
                      )
                          : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          for (var i in pokemon['next_evolution']) buildEvolve(i['name'], Color.fromRGBO(0, 200, 0, 1))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(40),
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('${pokemon['img']}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Color checkType(String type){
  if (type == "Grass") return Colors.green;
  else if (type == "Fire") return Colors.deepOrange;
  else if (type == "Water") return Colors.blue;
  else if (type == "Electric") return Colors.amber;
  else if (type == "Normal") return Colors.orange[600];
  else if (type == "Flying") return Colors.cyan;
  else if (type == "Ground") return Colors.teal;
  else if (type == "Rock") return Colors.grey[800];
  else if (type == "Fighting") return Colors.indigo;
  else if (type == "Ice") return Colors.lightBlueAccent;
  else if (type == "Poison") return Colors.deepPurpleAccent;
  else if (type == "Bug") return Colors.deepOrangeAccent;
  else if (type == "Psychic") return Colors.purple;
  else if (type == "Fairy") return Colors.lightGreen;
  else if (type == "Ghost") return Colors.deepPurple;
  else if (type == "Dark") return Colors.blueGrey[800];
  else if (type == "Steel") return Colors.greenAccent;
  else if (type == "Dragon") return Color.fromRGBO(255, 215, 0, 1);
  else return Colors.black;
}

TextStyle noEvolution(Color color) {
  return TextStyle(
    color: color,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );
}

TextStyle shapeStyle = TextStyle(
  color: Colors.white,
  fontSize: 15,
  fontWeight: FontWeight.w600,
  letterSpacing: 0.5,
);

Widget buildType(String type) {
  return Container(
    child: Card(
      color: checkType(type),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Text(
          type,
          style: shapeStyle,
          textAlign: TextAlign.center,
        ),
      ),
    ),
  );
}

Widget buildEvolve(String prev, Color color) {
  return Container(
    child: Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Text(
          prev,
          style: shapeStyle,
          textAlign: TextAlign.center,
        ),
      ),
    ),
  );
}
