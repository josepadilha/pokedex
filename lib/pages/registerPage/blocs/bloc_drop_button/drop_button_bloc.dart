import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/pages/registerPage/blocs/bloc_drop_button/drop_button_event.dart';
import 'package:pokedex/pages/registerPage/blocs/bloc_drop_button/drop_button_state.dart';
import 'package:pokedex/services/repository_drop_down_button.dart';

class DropDownButtonBloc extends Bloc<DropDownListEvent, DropDownButtonState> {
  final _dropDownRepository = DropDownButtonRepository();

  DropDownButtonBloc() : super(DropDownButtonInitialState()) {
    //on<LoadPokemonListEvent>((event, emit) => emit(
    //    PokeListSucessState(pokemons: _pokeRepository.loadedPokemonsDummy())));

    on<LoadedDropDownListEvent>((event, emit) => _loadDropDown(event, emit));

    // on<LoadedDropDownCategoryListEvent>(
    //     (event, emit) => _loadDropDownCategory(event, emit));
//
    // on<LoadedDropDownTypeListEvent>(
    //     (event, emit) => _loadDropDownType(event, emit));

    add(LoadedDropDownListEvent());
    //add(LoadedDropDownCategoryListEvent());
    //add(LoadedDropDownTypeListEvent());
  }

  void _loadDropDown(
      LoadedDropDownListEvent event, Emitter<DropDownButtonState> emit) async {
    emit(DropDownButtonLoadingState());
    try {
      List<String> dropDownListAbility =
          await _dropDownRepository.loadedAbility();
      List<String> dropDownListType = await _dropDownRepository.loadedType();
      List<String> dropDownListCategory =
          await _dropDownRepository.loadedCategory();

      emit(DropDownButtonSucessState(
          dropDownListAbility: dropDownListAbility,
          dropDownListCategory: dropDownListCategory,
          dropDownListType: dropDownListType));
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  //void _loadDropDownCategory(LoadedDropDownCategoryListEvent event,
  //    Emitter<DropDownButtonState> emit) async {
  //  emit(DropDownButtonLoadingState());
  //  try {
  //    List<String> dropDownList = await _dropDownRepository.loadedCategory();
  //    emit(DropDownButtonSucessState(dropDownList: dropDownList));
  //  } catch (e) {
  //    // ignore: avoid_print
  //    print(e);
  //  }
  //}
//
  //void _loadDropDownType(LoadedDropDownTypeListEvent event,
  //    Emitter<DropDownButtonState> emit) async {
  //  emit(DropDownButtonLoadingState());
  //  try {
  //    List<String> dropDownList = await _dropDownRepository.loadedType();
  //    emit(DropDownButtonSucessState(dropDownList: dropDownList));
  //  } catch (e) {
  //    // ignore: avoid_print
  //    print(e);
  //  }
  //}
}
