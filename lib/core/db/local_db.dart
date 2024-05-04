import 'package:food_recipe/features/domain/entities/food_recipe_entity.dart';
import 'package:hive/hive.dart';

class LocalDB {
  static void registerAdapters() {
    Hive.registerAdapter(FoodRecipeEntityAdapter());
  }

  static const _localFoodRecipeBoxKey = "LocalFoodRecipeBoxKey";

  static openBox() async {
    await Hive.openBox<FoodRecipeEntity>(_localFoodRecipeBoxKey);
  }

  static List<FoodRecipeEntity> getSavedRecipe() {
    return Hive.box<FoodRecipeEntity>(_localFoodRecipeBoxKey).values.toList();
  }
}
