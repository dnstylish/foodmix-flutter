import 'package:flutter/material.dart';

class PrefViewModel extends ChangeNotifier {
  int tabSelected = 3;


  void initialise() {
    notifyListeners();
  }

  void changeTab(int tab) {
    tabSelected = tab;
    notifyListeners();
  }
}