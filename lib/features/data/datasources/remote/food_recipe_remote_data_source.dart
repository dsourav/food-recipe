import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:food_recipe/core/exception/exception.dart';
import 'package:food_recipe/core/utils/constant.dart';
import 'package:food_recipe/features/data/models/food_recipe_model.dart';
import 'package:injectable/injectable.dart';

abstract class FoodRecipeRemoteDataSource {
  Future<List<FoodRecipeModel>> getAll(String searchTerm, int offset);
  getOne();
}

@Injectable(as: FoodRecipeRemoteDataSource)
class FoodRecipeRemoteDataSourceImpl implements FoodRecipeRemoteDataSource {
  final Dio _dio;
  FoodRecipeRemoteDataSourceImpl(Dio dio) : _dio = dio;

  @override
  Future<List<FoodRecipeModel>> getAll(String searchTerm, int offset) async {
    try {
      final response = await _dio.get("complexSearch?query=$searchTerm&offset=$offset&number=${Constant.itemPerPage}");

      if (response.statusCode == 200) {
        final results = response.data['results'];
        List<FoodRecipeModel> foodRecipes = (results as List).map((item) => FoodRecipeModel.fromJson(item)).toList();
        return foodRecipes;
      }
    } catch (_) {}
    throw ServerException();
  }

  @override
  getOne() {
    // TODO: implement getOne
    throw UnimplementedError();
  }
}
