import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'food_recipe_search_event.dart';
part 'food_recipe_search_state.dart';

class FoodRecipeSearchBloc extends Bloc<FoodRecipeSearchEvent, FoodRecipeSearchState> {
  FoodRecipeSearchBloc() : super(FoodRecipeSearchInitial()) {
    on<FoodRecipeSearchEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
