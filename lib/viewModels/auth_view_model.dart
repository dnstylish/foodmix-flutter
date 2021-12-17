import 'package:flutter/material.dart';
import 'package:foodmix/actions/network_action.dart';
import 'package:foodmix/models/user.dart';
import 'package:foodmix/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../const.dart';
import '../service_locator.dart';

class AuthViewModel extends BaseViewModel with NetworkAction {

  String email = '';
  String password = '';
  String name = '';

  bool isShowPass = false;
  bool isLoading = false;

  void initialise() {}

  AuthService get _authService => locator<AuthService>();

  String get userAvatar => $cdn(_authService.user?.avatar ?? 'https://i.imgur.com/pqGLgGr.jpg');

  bool get auth => _authService.$auth;

  User? get currentUser => _authService.user;

  Future<void> logOut() async  {
    await _authService.logOut();
    notifyListeners();
  }

  Future<void> login(BuildContext context) async {

    if([email, password].contains('')) {
      return;
    }
    await _authService.login(email: email, password: password);
    notifyListeners();

    if(auth) {
      showTopSnackBar(
        context,
        const CustomSnackBar.success(
          message: "Đăng nhập thành công",
          icon: Icon(Icons.add, color: Colors.transparent),
          backgroundColor: kPrimary,
        ),
      );

      Navigator.of(context).pop();
    }
  }

  Future<void> signUp() async{
    await _authService.signUp(name: name, email: email, password: password);
    notifyListeners();
  }

  void toggleShowPass() {
    isShowPass = !isShowPass;
    notifyListeners();
  }

}