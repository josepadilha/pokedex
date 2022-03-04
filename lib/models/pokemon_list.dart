import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/data/dummy_data.dart';
import 'package:pokedex/models/pokemons.dart';

class Pokelist with ChangeNotifier {
  List<Pokemon> _pokelist = dummyPokemons;

  List<Pokemon> get list => [..._pokelist];
  int get itensCount => _pokelist.length;
}
