import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_01/custom/custom_card.dart';
import 'package:pokedex_01/screens/pokemon_details.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map data = {};
  List pokeData;

  void getData() async {
    try {
      data = ModalRoute.of(context).settings.arguments;
      pokeData = data['pokemon'];
//      print("Data Received:\n$data");
//      print("\nPokemon -\n\n$pokeData");
//      print("\n\n${pokeData[0]['img']}");
    } catch (e) {
      print("Caught Error: $e");
    }
  }

  TextStyle nameStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.5,
  );

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      backgroundColor: Colors.red[200],
      body: SafeArea(
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(151, (index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PokemonDetails(
                      pokemon: pokeData[index],
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(1.5),
                child: Hero(
                  tag: pokeData[index]['img'],
                  transitionOnUserGestures: true,
                  child: PokemonCard(
                    image: Image.network(
                      '${pokeData[index]['img']}',
                    ),
                    name: Text(
                      '${pokeData[index]['name']}',
                      style: nameStyle,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
