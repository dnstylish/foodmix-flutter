import 'package:flutter/foundation.dart';
import 'package:foodmix/actions/response_actions.dart';
import 'package:foodmix/actions/secure_storage.dart';
import 'package:foodmix/actions/network_action.dart';
import 'package:foodmix/models/user.dart';

class AuthService with SecureStorage, NetworkAction, ResponseActions {

  String? _token;
  User? user;

  bool get $auth => user != null;
  String get $token => _token ?? '';

  Future<void> checkUser() async {
    _token = await readToken();
    if(_token != null) {
      await getMe();
    }
  }
  
  Future<void> getMe() async {
    try {
      
      NetworkResponse response = await $get('/users/me');
      user = makeUser(response.data);

    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      await deleteToken();
    }

  }

  Future<void> login({ required String email, required String password }) async {
    try {
      NetworkResponse response = await $post('/users/sign-in', data: { 'email': email, 'password': password });
      await writeToken(value: response.data);
      await checkUser();

    } catch (_) {}
  }

  Future<void> signUp({ required String name, required String email, required String password }) async{
    try {
      NetworkResponse response = await $post('/users/sign-up', data: { 'email': email, 'password': password, 'name': name });
      await writeToken(value: response.data);
      await checkUser();

    } catch (_) {}
  }

  Future<void> logOut() async {
    await deleteToken();
    _token = null;
    user = null;
  }

}