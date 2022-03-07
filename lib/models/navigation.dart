import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
}


// enumerator