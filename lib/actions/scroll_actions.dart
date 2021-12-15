import 'package:flutter/material.dart';

class ScrollActions {

  ScrollController scrollController = ScrollController();
  double showPress = 0;

  void setShowProcess(int point) {
    if(scrollController.offset < 0) {
      showPress = 0;
    } else if(scrollController.offset > point) {
      showPress = 1;
    } else {
      showPress = scrollController.offset / point;
    }
  }
}