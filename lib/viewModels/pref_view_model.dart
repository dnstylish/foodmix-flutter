import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodmix/actions/auth_action.dart';
import 'package:foodmix/actions/network_action.dart';
import 'package:foodmix/views/login_view.dart';
import 'package:stacked/stacked.dart';

class PrefViewModel extends BaseViewModel with NetworkAction, AuthAction {


  int tabSelected = 3;


  void initialise() {
    print('int');
  }

  void changeTab(int tab) {
    tabSelected = tab;
    notifyListeners();
  }

  String get userAvatar => $cdn(authService.user?.avatar ?? 'https://i.imgur.com/pqGLgGr.jpg');

  Future<void> logOut() async  {
    await authService.logOut();
    notifyListeners();
  }

  Future<void> toggleAuth(BuildContext context) async {
    if(!auth) {
      await Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginView()));
      notifyListeners();
    } else {
      logOut();
    }
  }

}