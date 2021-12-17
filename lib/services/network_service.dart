import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../const.dart';
import '../service_locator.dart';
import 'auth_service.dart';

class NetworkService {

  final Dio _dio = Dio();
  int lastCode = 200;

  BuildContext? context;

  NetworkService() {
    setInterceptor();
  }

  void setInterceptor() {
    _dio.interceptors.add(InterceptorsWrapper(
        onRequest:(options, handler){
          if (kDebugMode) {
            print('Request to ${ options.path }');
          }
          return handler.next(options);
        },
        onResponse:(response,handler) {
          if (kDebugMode) {
            print('Response from ${ response.requestOptions.path }');
          }
          if(response.data['code'] == 2 && response.data['msg'] != null) {
            _toastNotify(response.data['msg']);
          }
          lastCode = response.statusCode ?? 200;
          return handler.next(response); // continue
        },
        onError: (DioError e, handler) {
          if (kDebugMode) {
            print('Error from ${ e.response?.requestOptions.path }');
          }
          if(e.response?.data['code'] == 2 && e.response?.data['msg'] != null) {

            if(e.response?.data['msg'] is List) {
              _toastNotify(e.response?.data['msg'][0]['msg'] ?? '', success: false);
            } else {
              _toastNotify(e.response?.data['msg'] ?? '', success: false);
            }


          }
          lastCode = e.response?.statusCode ?? 200;
          return  handler.next(e);
        }


    ));

  }

  String  get _token => locator<AuthService>().$token;

  Dio get dio {

    _dio.options.headers['Authorization'] = 'Bearer $_token';

    return _dio;
  }

  void _toastNotify(String msg, { bool success = true }) {
    if(context != null) {
      if (kDebugMode) {
        print('Fire message: $msg');
        if(success) {
          showTopSnackBar(
            context!,
            CustomSnackBar.success(
              message: msg,
              icon: const Icon(Icons.add, color: Colors.transparent),
              backgroundColor: kPrimary,
            ),
          );
        } else {
          showTopSnackBar(
            context!,
            CustomSnackBar.error(
              message: msg,
              icon: const Icon(Icons.add, color: Colors.transparent),
              backgroundColor: Colors.deepOrange,
            ),
          );
        }
      }
    }
  }

}