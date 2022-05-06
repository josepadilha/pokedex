import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabBarRepository with ChangeNotifier {
  int pageSelectionIndex = 0;

  int getPageSelectionIndex() {
    return pageSelectionIndex;
  }

  int updatePageSelection(int index) {
    return pageSelectionIndex = index;
  }
}
