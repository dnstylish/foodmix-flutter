import 'package:flutter/material.dart';

class PrefViewModel extends ChangeNotifier {
  int tabSelected = 0;


  void initialise() {
    notifyListeners();
  }

  void changeTab(int tab) {
    tabSelected = tab;
    notifyListeners();
  }
}