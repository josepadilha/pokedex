import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/global_widget/tab_bar_widget/bloc/tab_bar_event.dart';
import 'package:pokedex/global_widget/tab_bar_widget/bloc/tab_bar_state.dart';
import 'package:pokedex/global_widget/tab_bar_widget/repository/navigation.dart';

class TabBarBloc extends Bloc<TabBarEvent, TabBarState> {
  final _tabBarRepository = TabBarRepository();

  TabBarBloc() : super(TabBarInitialState()) {
    on<AlternationOptionEvent>((event, emit) => emit(TabBarSucessState(
        index: _tabBarRepository.updatePageSelection(event.option))));
  }
}
