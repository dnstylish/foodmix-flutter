import 'package:dio/dio.dart';

class ServerAction {

  final String _baseURL = 'http://localhost:4000';
  final _Server server = _Server();

  Future<ServerResponse> $get<T>(String url, { Map<String, dynamic>? query }) async {
    var res = await server.dio.get('$_baseURL$url', queryParameters: query);
    return ServerResponse(code: res.data['code'], data: res.data['data'], msg: res.data['msg']);
  }

  String $cdn(String url) {
    return RegExp('^(http|https)').hasMatch(url) ? url : 'http://localhost:4000$url';
  }

}

class ServerResponse {
  final int code;
  final dynamic data;
  final String msg;

  ServerResponse({ this.code = 2, this.data, this.msg = '' });
}

class _Server {
  final Dio dio = Dio();
}