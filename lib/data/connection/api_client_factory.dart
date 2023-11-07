import 'package:dio/dio.dart';

class ApiClientFactory {
  static Dio create(String url) {
    final dio = Dio();
    dio.options.baseUrl = url;

    return dio;
  }
}
