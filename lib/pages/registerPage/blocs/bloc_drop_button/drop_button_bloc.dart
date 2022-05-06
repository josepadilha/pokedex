import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/pages/registerPage/blocs/bloc_drop_button/drop_button_event.dart';
import 'package:pokedex/pages/registerPage/blocs/bloc_drop_button/drop_button_state.dart';
import 'package:pokedex/services/repository_drop_down_button.dart';

class DropDownButtonBloc extends Bloc<DropDownListEvent, DropDownButtonState> {
  final _dropDownRepository = DropDownButtonRepository();

  DropDownButtonBloc() : super(DropDownButtonInitialState()) {
    on<LoadedDropDownListEvent>((event, emit) => _loadDropDown(event, emit));

    add(LoadedDropDownListEvent());
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
}
