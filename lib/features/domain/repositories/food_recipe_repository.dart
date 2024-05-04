import 'package:dartz/dartz.dart';
import 'package:food_recipe/core/exception/failure.dart';
import 'package:food_recipe/features/domain/entities/food_recipe_entity.dart';
import 'package:food_recipe/features/domain/entities/recipe_details_enitity.dart';
import 'package:food_recipe/features/domain/usecases/get_all_food_recipe_usecase.dart';

abstract class FoodRecipeRepository {
  Future<Either<Failure, List<FoodRecipeEntity>>> getAllRecipes(GetAllFoodRecipeParams params);
  Future<Either<Failure, RecipeDetailEntity>> getRecipeDetails(int id);
}
