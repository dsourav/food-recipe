import 'package:flutter/material.dart';
import 'package:food_recipe/core/db/local_db.dart';
import 'package:food_recipe/features/domain/entities/food_recipe_entity.dart';

extension HandleScrollNotification on ScrollNotification {
  bool handleScroll({Function? loadData}) {
    if (depth == 0) {
      if (this is ScrollEndNotification && loadData != null) {
        if (metrics.atEdge) {
          if (metrics.pixels != 0) {
            loadData();
          }
        }
      }
    }
    return false;
  }
}

extension MapFoodRecipe on List<FoodRecipeEntity> {
  List<FoodRecipeEntity> get withLocalSavedFlag {
    final localSavedRecipe = LocalDB.getSavedRecipe();

    return map((item) {
      item.isSavedLocally = localSavedRecipe.contains(item.id);
      return item;
    }).toList();
  }
}
