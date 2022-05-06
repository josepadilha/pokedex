import 'dart:convert';

import 'package:http/http.dart' as http;

class DropDownButtonRepository {
  Future<List<String>> loadedType() async {
    final List<String> _type = ['Tipo'];
    // ignore: avoid_print
    print('carreagndo informações');
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
