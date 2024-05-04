import 'package:dartz/dartz.dart';
import 'package:food_recipe/core/exception/exception.dart';
import 'package:food_recipe/core/exception/failure.dart';
import 'package:food_recipe/features/data/datasources/remote/food_recipe_remote_data_source.dart';
import 'package:food_recipe/features/domain/entities/food_recipe_entity.dart';
import 'package:food_recipe/features/domain/entities/recipe_details_enitity.dart';
import 'package:food_recipe/features/domain/repositories/food_recipe_repository.dart';
import 'package:food_recipe/features/domain/usecases/get_all_food_recipe_usecase.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: FoodRecipeRepository)
class FoodRecipeRepositoryImpl implements FoodRecipeRepository {
  final FoodRecipeRemoteDataSource recipeRemoteDataSource;

  FoodRecipeRepositoryImpl(this.recipeRemoteDataSource);

  @override
  Future<Either<Failure, List<FoodRecipeEntity>>> getAllRecipes(GetAllFoodRecipeParams params) async {
    try {
      final foodRecipes = await recipeRemoteDataSource.getAll(params.searchTerm, params.offset);
      return Right(foodRecipes);
    } on ServerException catch (_) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, RecipeDetailEntity>> getRecipeDetails(int id) async {
    try {
      final recipeModel = await recipeRemoteDataSource.getOne(id);
      final recipeEntity = RecipeDetailEntity.fromModel(recipeModel);
      return Right(recipeEntity);
    } on ServerException catch (_) {
      return Left(ServerFailure());
    }
  }
}
