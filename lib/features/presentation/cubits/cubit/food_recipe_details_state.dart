part of 'food_recipe_details_cubit.dart';

sealed class FoodRecipeDetailsState extends Equatable {
  const FoodRecipeDetailsState();

  @override
  List<Object> get props => [];
}

final class FoodRecipeDetailsInitial extends FoodRecipeDetailsState {}
