import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe/features/domain/entities/recipe_details_enitity.dart';
import 'package:food_recipe/features/domain/usecases/get_one_recipe_usecase.dart';
import 'package:injectable/injectable.dart';

part 'food_recipe_details_state.dart';

@Injectable()
class FoodRecipeDetailsCubit extends Cubit<FoodRecipeDetailsState> {
  final GetOneRecipeUseCase getOneRecipeUseCase;

  FoodRecipeDetailsCubit(this.getOneRecipeUseCase) : super(FoodRecipeDetailsLoading());

  loadRecipeDetails(int id) async {
    final currentState = state;
    if (currentState is! FoodRecipeDetailsLoading) {
      emit(FoodRecipeDetailsLoading());
    }
    final result = await getOneRecipeUseCase.call(GetOneRecipeParams(id: id));
    result.fold(
        (error) => emit(FoodRecipeDetailsLoadingFailed()), (item) => emit(FoodRecipeDetailsLoaded(entity: item)));
  }
}
