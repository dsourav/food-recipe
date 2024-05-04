import 'package:dartz/dartz.dart';
import 'package:food_recipe/core/exception/failure.dart';
import 'package:food_recipe/core/usecase/usecase.dart';
import 'package:food_recipe/features/domain/entities/recipe_details_enitity.dart';
import 'package:food_recipe/features/domain/repositories/food_recipe_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetOneRecipeUseCase implements UseCase<RecipeDetailEntity, GetOneRecipeParams> {
  final FoodRecipeRepository foodRecipeRepository;

  GetOneRecipeUseCase(this.foodRecipeRepository);
  @override
  Future<Either<Failure, RecipeDetailEntity>> call(GetOneRecipeParams params) {
    return foodRecipeRepository.getRecipeDetails(params.id);
  }
}

class GetOneRecipeParams {
  final int id;

  GetOneRecipeParams({required this.id});
}
