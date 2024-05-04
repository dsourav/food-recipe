import 'package:hive_flutter/hive_flutter.dart';

part 'food_recipe_entity.g.dart';

@HiveType(typeId: 0)
class FoodRecipeEntity extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String image;

  FoodRecipeEntity({required this.id, required this.title, required this.image});
}
