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

  void scrollTo(GlobalKey globalKey) {
    try {
      if(globalKey.currentContext != null) {
        scrollController.position.ensureVisible(
            globalKey.currentContext?.findRenderObject() as RenderObject,
            alignment: 0, // How far into view the item should be scrolled (between 0 and 1).
            duration: const Duration(seconds: 1)
        );
      }
    } catch (_) {}
  }
}