import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioClient {
  @singleton
  Dio dio() {
    Dio dio = Dio();

    dio.options.baseUrl = "https://jsonplaceholder.org/";
    dio.options.connectTimeout = const Duration(seconds: 30);
    dio.interceptors.clear();
    return dio;
  }
}
