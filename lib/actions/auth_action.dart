import 'package:flutter/material.dart';
import 'package:foodmix/models/user.dart';
import 'package:foodmix/services/auth_service.dart';

import '../service_locator.dart';

class AuthAction {


  @protected
  AuthService get authService => locator<AuthService>();

  bool get auth => authService.$auth;

  User? get currentUser => authService.user;
}