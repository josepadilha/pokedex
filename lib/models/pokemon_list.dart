import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemons.dart';
import 'package:http/http.dart' as http;

class Pokelist with ChangeNotifier {
  List<Pokemon> _pokelist = []; //dummyPokemons;

  List<Pokemon> get list => [..._pokelist];
  int get itensCount => _pokelist.length;

  bool isLoading = true;

  toggleLoading() {
    isLoading = false;
  }

  bool isSvgImage(String url) {
    bool endsWithFile = url.toLowerCase().endsWith('.svg');
    if (endsWithFile) {
      return true;
    } else {
      return false;
    }
  }

  void updateIsFavorite(bool isFavorite) {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  void addPokemons(Pokemon pokemon) {
    _pokelist.add(
      Pokemon(
        id: pokemon.id,
        name: pokemon.name,
        category: pokemon.category,
        type: pokemon.type,
        abilites: pokemon.abilites,
        description: pokemon.description,
        image: pokemon.image,
        isFavorite: false,
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
      final pokeSpecies = await http.get(
          Uri.parse('https://pokeapi.co/api/v2/pokemon-species/${index}/'));
      final Map<String, dynamic> dataSpecies = jsonDecode(pokeSpecies.body);

      //print(dataSpecies['egg_groups'][0]['name']);
      //print(dataSpecies['flavor_text_entries'][0]['flavor_text']);
      _pokelist.add(
        Pokemon(
          id: data['id'],
          name: data['name'],
          category: dataSpecies['egg_groups'][0]['name'],
          type: data['types'][0]['type']['name'],
          abilites: data['abilities'][0]['ability']['name'],
          description: dataSpecies['flavor_text_entries'][0]['flavor_text'],
          image: data['sprites']['back_default'],
        ),
      );
      toggleLoading();
    }

    notifyListeners();
  }
}

//pokeapi.co/api/v2/pokemon-species/{id or name}/ -- Link para pegar as categorias e descrições.

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