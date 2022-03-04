import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/appBars/app_Bar_Home.dart';
import 'package:pokedex/appBars/app_bar_pokelista.dart';
import 'package:pokedex/appBars/app_bar_register.dart';

import '../pages/home_page.dart';
import '../pages/poke_list_page.dart';
import '../pages/register_page.dart';

class Navigation with ChangeNotifier {
  int _pageSelectionIndex = 0;
  get pageSelectionIndex => _pageSelectionIndex;

  void updatePageSelection(int index) {
    _pageSelectionIndex = index;
    notifyListeners();
  }

  Widget tabsPage(int index) {
    final tabsPage = [
      HomePage(),
      PokeListPage(),
      RegisterPage(),
    ];

    return tabsPage[index];
  }

  Object appBar(int index) {
    final AppBars = [
      'POKEDEX',
      {'POKELIST': Icon(Icons.star)},
      'CADASTRE SEU POKEMON'
    ];
    return AppBars[index];
  }
}


// enumerator