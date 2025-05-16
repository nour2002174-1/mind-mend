import 'package:flutter/material.dart';

// BottomNavViewModel (Provider class)
class BottomNavViewModel extends ChangeNotifier {
  int _currentIndex = 2;

  int get currentIndex => _currentIndex;

  void changeIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
