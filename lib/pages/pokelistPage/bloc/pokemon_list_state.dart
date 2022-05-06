import 'package:pokedex/models/pokemons.dart';

class PokeListState {
  List<Pokemon>? pokemons;

  PokeListState({
    this.pokemons,
  });
}

class PokeListLoadingState extends PokeListState {
  List<Pokemon>? pokemons;
  PokeListLoadingState({this.pokemons}); // dúvida sobre o super.
}

class PokeListInitialState extends PokeListState {
  List<Pokemon>? pokemons;
  PokeListInitialState(this.pokemons); // dúvida sobre o super.
}

class PokeListSucessState extends PokeListState {
  final List<Pokemon> pokemons;
  PokeListSucessState({
    required this.pokemons,
  });
}
