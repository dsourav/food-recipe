import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe/core/di/injectable.dart';
import 'package:food_recipe/core/utils/app_decorations.dart';
import 'package:food_recipe/features/domain/entities/recipe_details_enitity.dart';

import 'package:food_recipe/features/presentation/cubits/food_recipe_details/food_recipe_details_cubit.dart';
import 'package:food_recipe/features/presentation/widgets/app_network_image.dart';
import 'package:food_recipe/features/presentation/widgets/load_failed_item.dart';
import 'package:food_recipe/features/presentation/widgets/shimmer/item_details_placeholder.dart';
import 'package:go_router/go_router.dart';

class FoodRecipeDetailsPage extends StatelessWidget {
  final int id;
  const FoodRecipeDetailsPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<FoodRecipeDetailsCubit>()..loadRecipeDetails(id),
      child: Builder(
        builder: (_) => Scaffold(
          body: BlocBuilder<FoodRecipeDetailsCubit, FoodRecipeDetailsState>(
            builder: (context, state) {
              if (state is FoodRecipeDetailsLoading) {
                return const ItemDetailsPlaceHolder();
              } else if (state is FoodRecipeDetailsLoadingFailed) {
                return LoadFailedItem(
                  onRetry: () {
                    context.read<FoodRecipeDetailsCubit>().loadRecipeDetails(id);
                  },
                );
              } else if (state is FoodRecipeDetailsLoaded) {
                final item = state.entity;
                return RecipeDetailsItem(item: item);
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}

class RecipeDetailsItem extends StatelessWidget {
  const RecipeDetailsItem({
    super.key,
    required this.item,
  });

  final RecipeDetailEntity item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      children: [
        SizedBox(
          height: 280,
          width: double.infinity,
          child: AppNetworkImage(
            imageUrl: item.image,
            imageShape: ImageShape.square,
            fit: BoxFit.cover,
          ),
        ),
        SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  constraints: const BoxConstraints(maxHeight: 200),
                ),
                Container(
                  constraints: const BoxConstraints(maxHeight: 300.0),
                  width: double.infinity,
                  decoration: AppDecorations.cardDecoration,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 12.0),
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                item.title,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.titleLarge,
                              ),
                            ),
                            Wrap(
                              alignment: WrapAlignment.center,
                              spacing: 2.0,
                              children: [
                                const Icon(
                                  Icons.punch_clock_outlined,
                                  size: 18,
                                ),
                                Text("${item.preparationInMinutes} min", style: theme.textTheme.titleSmall)
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        Text("Ingredients", style: theme.textTheme.titleMedium),
                        ...item.extendedIngredients.map((item) => Container(
                              margin: const EdgeInsets.symmetric(vertical: 6.0),
                              child: Row(
                                children: [
                                  Container(
                                    height: 16,
                                    width: 2,
                                    color: Colors.green,
                                  ),
                                  const SizedBox(width: 8.0),
                                  Flexible(child: Text(item))
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                Text("Instructions", style: theme.textTheme.titleMedium),
                Text(
                  item.instructions,
                  textAlign: TextAlign.justify,
                )
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: const EdgeInsets.only(top: 20.0),
            child: IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: const Icon(Icons.clear)),
          ),
        )
      ],
    );
  }
}
