import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/data/dummy_data.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/models/pokemons.dart';
import 'package:http/http.dart' as http;

class Pokelist with ChangeNotifier {
  List<Pokemon> _pokelist = []; //dummyPokemons;

  List<Pokemon> get list => [..._pokelist];
  int get itensCount => _pokelist.length;

  void addPokemons(Pokemon pokemon) {
    _pokelist.add(
      Pokemon(
        id: pokemon.id,
        name: pokemon.name,
        type: pokemon.type,
        abilites: pokemon.abilites,
        image: pokemon.image,
      ),
    );
  }

  Future<void> loadedPokemons() async {
    _pokelist.clear();
    int index;
    for (index = 1; index < 16; index++) {
      final response = await http
          .get(Uri.parse('https://pokeapi.co/api/v2/pokemon/${index}/'));
      final Map<String, dynamic> data = jsonDecode(response.body);
      //print(data['name']);

      _pokelist.add(
        Pokemon(
          id: data['id'],
          name: data['name'],
          type: data['types'][0]['type']['name'],
          abilites: data['abilities'][0]['ability']['name'],
          image: data['sprites']['back_default'],
        ),
      );
    }
    notifyListeners();
  }
}
//data.forEach((key, value) {
    // list.add(Pokemon(name: value['name']));
    // print(list);
    //});

    //print(data['abilities'][0]['ability']['name']); // ability
    //print(data['name']); // name
    //print(data['id']); // id
    //print(data['types'][0]['type']['name']); // type
    //print(data['sprites']['back_default']); // image
    //List<dynamic> listPokemons = data['results'];
    //final nomes = listPokemons.map((e) => Pokemon(name: e['name'])).toList();

//
    //print(nomes[0].abilites);
    // data.forEach((key, value) {
    //   list.add(Pokemon(name: value['name']));
    //   print(list);
    // });