import 'package:flutter/foundation.dart';
import 'package:food_recipe/features/domain/entities/food_recipe_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalDB {
  static void registerAdapters() {
    Hive.registerAdapter(FoodRecipeEntityAdapter());
  }

  static const localFoodRecipeBoxKey = "LocalFoodRecipeBoxKey";

  static final _foodRecipeBox = Hive.box<FoodRecipeEntity>(localFoodRecipeBoxKey);

  static openBox() async {
    await Hive.openBox<FoodRecipeEntity>(localFoodRecipeBoxKey);
  }

  static Set<dynamic> getSavedRecipe() {
    return _foodRecipeBox.keys.toSet();
  }

  static Future updateLocalRecipe(FoodRecipeEntity entity) {
    final recipe = _foodRecipeBox.get(entity.id);
    if (recipe != null) {
      return recipe.delete();
    } else {
      return _foodRecipeBox.put(entity.id, entity);
    }
  }

  static ValueListenable<Box<FoodRecipeEntity>> listenToRecipe() {
    return _foodRecipeBox.listenable();
  }
}
