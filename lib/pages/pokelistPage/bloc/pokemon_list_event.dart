import 'package:pokedex/models/pokemons.dart';

abstract class PokeEvent {}

class LoadedPokemonListEvent extends PokeEvent {}

class LoadingPokemonListEvent extends PokeEvent {}

class GetPokemonListEvent extends PokeEvent {}

class AddPokemonEvent extends PokeEvent {
  Pokemon pokemon;

  AddPokemonEvent({
    required this.pokemon,
  });
}

class UpdatePokemonEvent extends PokeEvent {
  Pokemon pokemon;
  int index;
  UpdatePokemonEvent({
    required this.pokemon,
    required this.index,
  });
}
