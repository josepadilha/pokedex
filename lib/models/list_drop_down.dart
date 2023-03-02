import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ListDropDown with ChangeNotifier {
  final List<String> type = [];
  final List<String> category = [];
  final List<String> ability = [];
  String selectCategory = '';
  String selectType = '';
  String selectAbility = '';
  List<String> _newList = [];

  Future<void> loadedType() async {
    type.add('Tipo');
    int index;
    final response =
        await http.get(Uri.parse('https://pokeapi.co/api/v2/type'));
    final Map<String, dynamic> data = jsonDecode(response.body);

    for (index = 0; index < data['results'].length; index++) {
      type.add(data['results'][index]['name']);
    }
    notifyListeners();
  }

  Future<void> loadedCategory() async {
    category.add('Categoria');
    int index;
    final response =
        await http.get(Uri.parse('https://pokeapi.co/api/v2/egg-group/'));
    final Map<String, dynamic> data = jsonDecode(response.body);

    for (index = 0; index < data['results'].length; index++) {
      category.add(data['results'][index]['name']);
    }
    notifyListeners();
  }

  Future<void> loadedAbility() async {
    ability.add('Habilidades');
    int index;
    final response =
        await http.get(Uri.parse('https://pokeapi.co/api/v2/ability'));
    final Map<String, dynamic> data = jsonDecode(response.body);

    for (index = 0; index < data['results'].length; index++) {
      ability.add(data['results'][index]['name']);
    }
    notifyListeners();
  }
}
