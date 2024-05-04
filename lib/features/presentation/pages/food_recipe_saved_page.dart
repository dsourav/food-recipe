import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe/core/db/local_db.dart';
import 'package:food_recipe/core/routing/route_path.dart';
import 'package:food_recipe/features/presentation/blocs/food_recipe_search/food_recipe_search_bloc.dart';
import 'package:food_recipe/features/presentation/widgets/food_recipe_item.dart';
import 'package:go_router/go_router.dart';

class FoodRecipeSavedPage extends StatelessWidget {
  const FoodRecipeSavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: ValueListenableBuilder(
        valueListenable: LocalDB.listenToRecipe(),
        builder: (context, box, widget) {
          final items = box.values.toList();
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return FoodRecipeItem(
                foodRecipeEntity: items[index],
                onTap: () {
                  context.pushNamed(RoutePath.recipeDetails, extra: items[index].id);
                },
                onTapSave: () {
                  context.read<FoodRecipeSearchBloc>().add(FoodRecipeUpdateLocal(entity: items[index]));
                },
              );
            },
          );
        },
      ),
    );
  }
}
