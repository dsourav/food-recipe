import 'package:equatable/equatable.dart';
import 'package:food_recipe/features/data/models/recipe_details_model.dart';

class RecipeDetailEntity extends Equatable {
  final int preparationInMinutes;
  final List<String> extendedIngredients;
  final String title;
  final String instructions;
  final String image;

  const RecipeDetailEntity(
      {required this.preparationInMinutes,
      required this.extendedIngredients,
      required this.title,
      required this.instructions,
      required this.image});

  factory RecipeDetailEntity.fromModel(RecipeDetailsModel model) {
    return RecipeDetailEntity(
        preparationInMinutes: model.preparationMinutes,
        extendedIngredients: model.extendedIngredients.map((item) => item.original).toList(),
        title: model.title,
        instructions: model.instructions,
        image: model.image);
  }

  @override
  List<Object?> get props => [preparationInMinutes, extendedIngredients, title, instructions, image];
}
