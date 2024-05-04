import 'package:dartz/dartz.dart';
import 'package:food_recipe/core/exception/failure.dart';
import 'package:food_recipe/core/usecase/usecase.dart';
import 'package:food_recipe/features/domain/entities/food_recipe_entity.dart';
import 'package:food_recipe/features/domain/repositories/food_recipe_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetAllRecipeUseCase implements UseCase<List<FoodRecipeEntity>, GetAllFoodRecipeParams> {
  final FoodRecipeRepository foodRecipeRepository;

  GetAllRecipeUseCase(this.foodRecipeRepository);
  @override
  Future<Either<Failure, List<FoodRecipeEntity>>> call(GetAllFoodRecipeParams params) {
    return foodRecipeRepository.getAllRecipes(params);
  }
}

class GetAllFoodRecipeParams {
  final int offset;
  final String searchTerm;

  GetAllFoodRecipeParams({
    required this.offset,
    required this.searchTerm,
  });
}
