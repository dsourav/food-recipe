part of 'food_recipe_search_bloc.dart';

sealed class FoodRecipeSearchState extends Equatable {
  const FoodRecipeSearchState();

  @override
  List<Object> get props => [];
}

final class FoodRecipeSearchInitial extends FoodRecipeSearchState {}

final class FoodRecipesLoaded extends FoodRecipeSearchState {
  final List<FoodRecipeEntity> foodRecipeEntity;
  final bool hasReachedMax;
  const FoodRecipesLoaded({required this.foodRecipeEntity, this.hasReachedMax = false});

  FoodRecipesLoaded copyWith({
    List<FoodRecipeEntity>? foodRecipeEntity,
    bool? hasReachedMax,
  }) {
    return FoodRecipesLoaded(
      foodRecipeEntity: foodRecipeEntity ?? this.foodRecipeEntity,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [foodRecipeEntity, hasReachedMax];
}

final class FoodRecipeLoadingFailed extends FoodRecipeSearchState {}

final class FoodRecipeLoading extends FoodRecipeSearchState {}
