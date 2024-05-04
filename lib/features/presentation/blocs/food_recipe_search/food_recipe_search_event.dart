part of 'food_recipe_search_bloc.dart';

sealed class FoodRecipeSearchEvent extends Equatable {
  const FoodRecipeSearchEvent();

  @override
  List<Object> get props => [];
}

class FoodRecipeSearchTermChanged extends FoodRecipeSearchEvent {
  final String searchTerm;

  const FoodRecipeSearchTermChanged({required this.searchTerm});
}

class FoodRecipeLoadMore extends FoodRecipeSearchEvent {
  final String searchTerm;
  const FoodRecipeLoadMore({required this.searchTerm});
}

class FoodRecipeUpdateLocal extends FoodRecipeSearchEvent {
  final FoodRecipeEntity entity;

  const FoodRecipeUpdateLocal({required this.entity});
}
