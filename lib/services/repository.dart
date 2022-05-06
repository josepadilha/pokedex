import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:pokedex/models/pokemons.dart';
import 'package:http/http.dart' as http;

class PokelistRepository {
  Future<List<Pokemon>> loadedPokemons() async {
    final List<Pokemon> _pokeList = [];
    int index;
    for (index = 1; index < 16; index++) {
      final response = await http
          .get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$index/'));
      final Map<String, dynamic> data = jsonDecode(response.body);

      final pokeSpecies = await http
          .get(Uri.parse('https://pokeapi.co/api/v2/pokemon-species/$index/'));
      final Map<String, dynamic> dataSpecies = jsonDecode(pokeSpecies.body);

      _pokeList.add(
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
    return _pokeList;
  }

  List<Pokemon> updatePokemon(List<Pokemon> list, Pokemon pokemon, int index) {
    list[index] = Pokemon(
      id: pokemon.id,
      name: pokemon.name,
      category: pokemon.category,
      type: pokemon.type,
      abilites: pokemon.abilites,
      description: pokemon.description,
      image: pokemon.image,
      isFavorite: !pokemon.isFavorite,
      imageFile: pokemon.imageFile,
    );

    return list;
  }
}

class ImageFileRepository {
  Future<File?> selectFile() async {
    File? _imagePokemon;
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(
        source: ImageSource.gallery, maxWidth: 127, maxHeight: 127);
    if (image == null) return _imagePokemon;

    return _imagePokemon = File(image.path);
  } // função que seleciona um arquivo e preenche na tela de registro.
}
