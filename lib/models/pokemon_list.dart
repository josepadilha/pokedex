import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pokedex/models/pokemons.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class Pokelist with ChangeNotifier {
  List<Pokemon> _pokelist = []; //dummyPokemons;
  List<Pokemon> newList = [];
  List<Pokemon> get list => [..._pokelist];
  int get itensCount => _pokelist.length;
  File? imagePokemon = null;
  bool isLoading = false;

  toggleLoading() {
    isLoading = !isLoading;
  }

  selectFile() async {
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(
        source: ImageSource.gallery, maxWidth: 127, maxHeight: 127);
    if (image == null) return;

    imagePokemon = File(image.path);

    //final appDir = await syspaths.getApplicationDocumentsDirectory();
    //String fileName = path.basename(imagePokemon!.path);
    //final savedImage = await imagePokemon!.copy('${appDir.path}/${fileName}');

    notifyListeners();
  } // função que seleciona um arquivo e preenche na tela de registro.

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
        imageFile: pokemon.imageFile,
        isFavorite: false,
      ),
    );
    notifyListeners();
  }

  Future<void> loadedPokemons() async {
    if (newList.isNotEmpty) return;
    toggleLoading();
    int index;
    for (index = 1; index < 16; index++) {
      final response = await http
          .get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$index/'));
      final Map<String, dynamic> data = jsonDecode(response.body);
      final pokeSpecies = await http.get(
          Uri.parse('https://pokeapi.co/api/v2/pokemon-species/$index/'));
      final Map<String, dynamic> dataSpecies = jsonDecode(pokeSpecies.body);
      newList.add(
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
    }
    toggleLoading();
    _pokelist.addAll(newList);
    notifyListeners();
  }
}
