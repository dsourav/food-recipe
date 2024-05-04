part of 'food_recipe_details_cubit.dart';

sealed class FoodRecipeDetailsState extends Equatable {
  const FoodRecipeDetailsState();

  @override
  List<Object> get props => [];
}

final class FoodRecipeDetailsLoading extends FoodRecipeDetailsState {}

final class FoodRecipeDetailsLoaded extends FoodRecipeDetailsState {
  final RecipeDetailEntity entity;

  const FoodRecipeDetailsLoaded({required this.entity});
}

final class FoodRecipeDetailsLoadingFailed extends FoodRecipeDetailsState {}
