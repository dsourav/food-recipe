import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe/core/routing/route_path.dart';
import 'package:food_recipe/core/utils/extensions.dart';
import 'package:food_recipe/features/presentation/blocs/food_recipe_search/food_recipe_search_bloc.dart';
import 'package:food_recipe/features/presentation/widgets/food_recipe_item.dart';
import 'package:food_recipe/features/presentation/widgets/load_failed_item.dart';
import 'package:food_recipe/features/presentation/widgets/shimmer/list_item_placeholder.dart';
import 'package:food_recipe/features/presentation/widgets/shimmer/list_page_placeholder.dart';
import 'package:go_router/go_router.dart';

class FoodRecipeSearchPage extends StatelessWidget {
  FoodRecipeSearchPage({super.key});

  final _recipeNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextFormField(
            controller: _recipeNameController,
            onChanged: (value) {
              context.read<FoodRecipeSearchBloc>().add(FoodRecipeSearchTermChanged(searchTerm: value));
            },
            decoration: InputDecoration(
              hintText: 'Write Recipe Name',
              suffixIcon: IconButton(
                  onPressed: () {
                    context
                        .read<FoodRecipeSearchBloc>()
                        .add(FoodRecipeSearchTermChanged(searchTerm: _recipeNameController.text));
                  },
                  icon: const Icon(Icons.search)),
            ),
          ),

          Expanded(
            child: BlocBuilder<FoodRecipeSearchBloc, FoodRecipeSearchState>(
              builder: (context, state) {
                if (state is FoodRecipeLoading) {
                  return const ListPagePlaceholder();
                } else if (state is FoodRecipeLoadingFailed) {
                  return LoadFailedItem(
                    onRetry: () {
                      context
                          .read<FoodRecipeSearchBloc>()
                          .add(FoodRecipeSearchTermChanged(searchTerm: _recipeNameController.text));
                    },
                  );
                } else if (state is FoodRecipesLoaded) {
                  final items = state.foodRecipeEntity;

                  return NotificationListener<ScrollNotification>(
                    onNotification: (notification) => notification.handleScroll(loadData: () {
                      context
                          .read<FoodRecipeSearchBloc>()
                          .add(FoodRecipeLoadMore(searchTerm: _recipeNameController.text));
                    }),
                    child: ListView.builder(
                        itemCount: state.hasReachedMax ? items.length : items.length + 1,
                        itemBuilder: (context, index) {
                          if (index >= items.length) {
                            return const ListItemPlaceHolder();
                          }

                          return FoodRecipeItem(
                            onTap: () {
                              context.pushNamed(RoutePath.recipeDetails, extra: items[index].id);
                            },
                            foodRecipeEntity: items[index],
                            onTapSave: () {
                              context.read<FoodRecipeSearchBloc>().add(FoodRecipeUpdateLocal(entity: items[index]));
                            },
                          );
                        }),
                  );
                }

                return const SizedBox();
              },
            ),
          )
          // Expanded(child: child)
        ],
      ),
    );
  }
}
