import 'package:flutter/material.dart';
import 'package:food_recipe/core/utils/app_decorations.dart';
import 'package:food_recipe/features/domain/entities/food_recipe_entity.dart';
import 'package:food_recipe/features/presentation/widgets/app_network_image.dart';

class FoodRecipeItem extends StatelessWidget {
  final FoodRecipeEntity foodRecipeEntity;
  final VoidCallback onTapSave;
  const FoodRecipeItem({
    super.key,
    required this.foodRecipeEntity,
    required this.onTapSave,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 203,
      decoration: AppDecorations.cardDecoration,
      margin: const EdgeInsets.only(top: 10.0),
      child: Column(
        children: [
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
                child: Stack(
                  children: [
                    AppNetworkImage(
                      size: const Size(double.infinity, double.infinity),
                      imageUrl: foodRecipeEntity.image,
                      imageShape: ImageShape.square,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 1,
                      right: 1,
                      child: InkWell(
                        onTap: onTapSave,
                        child: Container(
                            height: 32,
                            width: 32,
                            margin: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
                            child: const Icon(Icons.bookmark_outline)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50.0,
            width: double.infinity,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    foodRecipeEntity.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
