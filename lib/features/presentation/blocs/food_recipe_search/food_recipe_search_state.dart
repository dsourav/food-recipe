part of 'food_recipe_search_bloc.dart';

sealed class FoodRecipeSearchState extends Equatable {
  const FoodRecipeSearchState();
  
  @override
  List<Object> get props => [];
}

final class FoodRecipeSearchInitial extends FoodRecipeSearchState {}
