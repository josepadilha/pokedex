import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/models/pokemons.dart';

class Request {
  final url = 'https://pokeapi.co/api/v2/pokemon/?offset=150&limit=15';
  final list = [];
}
