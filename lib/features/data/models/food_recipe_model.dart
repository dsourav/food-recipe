import 'package:food_recipe/features/domain/entities/food_recipe_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'food_recipe_model.g.dart';

@JsonSerializable(createToJson: false)
class FoodRecipeModel extends FoodRecipeEntity {
  FoodRecipeModel({required super.id, required super.title, required super.image});

  factory FoodRecipeModel.fromJson(Map<String, dynamic> json) => _$FoodRecipeModelFromJson(json);
}
