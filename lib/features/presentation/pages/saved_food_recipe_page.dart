import 'package:flutter/material.dart';
import 'package:food_recipe/features/presentation/widgets/app_network_image.dart';
import 'package:food_recipe/features/presentation/widgets/shimmer/list_page_placeholder.dart';

class SavedFoodRecipePage extends StatelessWidget {
  const SavedFoodRecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      // fit: StackFit.expand,
      children: [
        const SizedBox(
          height: 300,
          width: double.infinity,
          child: AppNetworkImage(
            imageUrl: "https://via.placeholder.com/140x100",
            imageShape: ImageShape.square,
            fit: BoxFit.cover,
          ),
        ),
        Column(
          children: [
            const SizedBox(height: 220),
            Expanded(
                child: Container(
              margin: const EdgeInsets.all(10.0),
              child: const SingleChildScrollView(
                  child: Column(
                children: [],
              )),
            ))
          ],
        ),
      ],
    );
  }
}
