import 'package:json_annotation/json_annotation.dart';

part 'recipe_details_model.g.dart';

@JsonSerializable(explicitToJson: true, createToJson: false)
class RecipeDetailsModel {
  final int preparationMinutes;
  final List<ExtendedIngredients> extendedIngredients;
  final String title;
  final String instructions;
  final String image;

  RecipeDetailsModel(
      {required this.preparationMinutes,
      required this.extendedIngredients,
      required this.title,
      required this.instructions,
      required this.image});

  factory RecipeDetailsModel.fromJson(Map<String, dynamic> json) => _$RecipeDetailsModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class ExtendedIngredients {
  final String original;

  ExtendedIngredients({required this.original});

  factory ExtendedIngredients.fromJson(Map<String, dynamic> json) => _$ExtendedIngredientsFromJson(json);
}
