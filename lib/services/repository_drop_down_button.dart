import 'dart:convert';

import 'package:http/http.dart' as http;

class DropDownButtonRepository {
  // List<String> get type => _type;
  // List<String> get category => _category;
  // List<String> get ability => _ability;

  String selectCategory = '';
  String selectType = '';
  String selectAbility = '';

  Future<List<String>> loadedType() async {
    final List<String> _type = ['Tipo'];
    // ignore: avoid_print
    print('carreagndo informações');
    //type.add('Tipo');
    int index;
    final response =
        await http.get(Uri.parse('https://pokeapi.co/api/v2/type'));
    final Map<String, dynamic> data = jsonDecode(response.body);

    for (index = 0; index < data['results'].length; index++) {
      _type.add(data['results'][index]['name']);
    }
    return _type;
  }

  Future<List<String>> loadedCategory() async {
    final List<String> _category = ['Categoria'];
    int index;
    final response =
        await http.get(Uri.parse('https://pokeapi.co/api/v2/egg-group/'));
    final Map<String, dynamic> data = jsonDecode(response.body);

    for (index = 0; index < data['results'].length; index++) {
      _category.add(data['results'][index]['name']);
    }

    return _category;
  }

  Future<List<String>> loadedAbility() async {
    final List<String> _ability = ['Habilidades'];

    int index;
    final response =
        await http.get(Uri.parse('https://pokeapi.co/api/v2/ability'));
    final Map<String, dynamic> data = jsonDecode(response.body);

    for (index = 0; index < data['results'].length; index++) {
      _ability.add(data['results'][index]['name']);
    }

    return _ability;
  }
}
