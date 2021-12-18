import 'package:flutter/foundation.dart';
import 'package:foodmix/services/network_service.dart';

import '../service_locator.dart';

class NetworkAction {

  final String _baseURL = 'http://localhost:4000';
  final NetworkService server = locator<NetworkService>();

  @protected
  Future<NetworkResponse> $get<T>(String url, { Map<String, dynamic>? query }) async {
    var res = await server.dio.get('$_baseURL$url', queryParameters: query);
    return NetworkResponse(code: res.data['code'], data: res.data['data'], msg: res.data['msg']);
  }

  @protected
  Future<NetworkResponse> $post(String url, { Map<String, dynamic>? data }) async {
    var res = await server.dio.post('$_baseURL$url', data: data);
    return NetworkResponse(code: res.data['code'], data: res.data['data'], msg: res.data['msg']);
  }

  @protected
  Future<NetworkResponse> $delete(String url, { Map<String, dynamic>? data  }) async {
    var res = await server.dio.delete('$_baseURL$url', data: data);
    return NetworkResponse(code: res.data['code'], data: res.data['data'], msg: res.data['msg']);
  }

  String $cdn(String url) {
    return RegExp('^(http|https)').hasMatch(url) ? url : '$_baseURL$url';
  }

}

class NetworkResponse {
  final int code;
  final dynamic data;
  final String msg;

  NetworkResponse({ this.code = 2, this.data, this.msg = '' });
}