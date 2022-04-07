import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/models/informations.dart';

class ListDropDown with ChangeNotifier {
  final List type = [];
  final List category = [];
  final List ability = [];
  Future<void> loadedType() async {
    int index;
    final response =
        await http.get(Uri.parse('https://pokeapi.co/api/v2/type'));
    final Map<String, dynamic> data = jsonDecode(response.body);

    for (index = 0; index < data['results'].length; index++) {
      type.add(data['results'][index]['name']);
    }
    print(type);
  }

  Future<void> loadedCategory() async {
    int index;
    final response =
        await http.get(Uri.parse('https://pokeapi.co/api/v2/egg-group/'));
    final Map<String, dynamic> data = jsonDecode(response.body);

    for (index = 0; index < data['results'].length; index++) {
      category.add(data['results'][index]['name']);
    }
    print(category);
  }

  Future<void> loadedAbility() async {
    int index;
    final response =
        await http.get(Uri.parse('https://pokeapi.co/api/v2/ability'));
    final Map<String, dynamic> data = jsonDecode(response.body);

    for (index = 0; index < data['results'].length; index++) {
      ability.add(data['results'][index]['name']);
    }
    print(ability);
  }
}
