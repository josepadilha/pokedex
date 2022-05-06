import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/models/pokemons.dart';
import 'package:pokedex/pages/pokelistPage/bloc/pokemon_list_event.dart';
import 'package:pokedex/pages/pokelistPage/bloc/pokemon_list_state.dart';
import 'package:pokedex/services/repository.dart';

class PokeBloc extends Bloc<PokeEvent, PokeListState> {
  final _pokeRepository = PokelistRepository();

  PokeBloc() : super(PokeListInitialState([])) {
    on<AddPokemonEvent>((event, emit) => _addPokemons(event, emit));

    on<UpdatePokemonEvent>((event, emit) => _updatePokemon(event, emit));

    on<LoadedPokemonListEvent>((event, emit) => _loadPokemons(event, emit));

    add(LoadedPokemonListEvent());
  }

  void _updatePokemon(UpdatePokemonEvent event, Emitter<PokeListState> emit) {
    List<Pokemon> pokemons = [...state.pokemons!];
    pokemons =
        _pokeRepository.updatePokemon(pokemons, event.pokemon, event.index);
    emit(PokeListSucessState(pokemons: pokemons));
  }

  void _addPokemons(AddPokemonEvent event, Emitter<PokeListState> emit) {
    List<Pokemon> pokemons = [...state.pokemons!];
    emit(PokeListLoadingState());
    pokemons.add(event.pokemon);
    emit(PokeListSucessState(pokemons: pokemons));
  }

  void _loadPokemons(
      LoadedPokemonListEvent event, Emitter<PokeListState> emit) async {
    emit(PokeListLoadingState());
    try {
      List<Pokemon> pokemons = await _pokeRepository.loadedPokemons();
      emit(PokeListSucessState(pokemons: pokemons));
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
