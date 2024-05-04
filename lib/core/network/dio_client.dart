import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioClient {
  @singleton
  Dio dio() {
    Dio dio = Dio();

    dio.options.baseUrl = "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/";
    dio.options.headers = {"X-RapidAPI-Key": "1a2bd7d529msh513ba3b70195a79p1acf77jsned01ab52cffa"};
    dio.options.connectTimeout = const Duration(seconds: 30);
    dio.interceptors.clear();
    return dio;
  }
}
