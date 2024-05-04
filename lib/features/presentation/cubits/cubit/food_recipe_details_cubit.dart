import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'food_recipe_details_state.dart';

class FoodRecipeDetailsCubit extends Cubit<FoodRecipeDetailsState> {
  FoodRecipeDetailsCubit() : super(FoodRecipeDetailsInitial());
}
