import 'package:flutter/material.dart';

class MainScreenNotifier extends ChangeNotifier {
  int _pageindex = 0;
  int get pageindex => _pageindex;
  set pageindex(int newIndex) {
    _pageindex = newIndex;
    notifyListeners();
  }
}
