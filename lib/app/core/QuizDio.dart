import 'package:dio/dio.dart';

class QuizDio {
  var _dio;

  QuizDio() {
    _dio = Dio(options);
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: _onRequest,
      onResponse: _onResponse,
      onError: _onError
    ));
  }

  QuizDio.withAuth() {
    _dio = Dio(options);
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: _onRequestWithAuth,
      onResponse: _onResponse,
      onError: _onError
    ));
  }

  BaseOptions options = BaseOptions(
    baseUrl: '',
    connectTimeout: 30000,
    receiveTimeout: 30000,
  );

  Dio get instance => _dio;

  _onResponse(Response e) {
    print('_________________');
    print(e.data);
    print('_________________');
  }

  _onRequestWithAuth(RequestOptions opt) {
    var token = '';
    opt.headers[''] = token;
    opt.headers['Content-Type'] = 'application/json';
  }

  _onRequest(RequestOptions opt) {
    var token = '';
    opt.headers[''] = token;
    opt.headers['Content-Type'] = 'application/json';
  }

  _onError(DioError e) {
    if (e.response?.statusCode == 403 || e.response?.statusCode == 401) {
      print('logout');
    }
    return e;
  }
}
