import 'package:flutter/material.dart';
import 'package:food_recipe/features/presentation/widgets/shimmer/placeholers.dart';
import 'package:shimmer/shimmer.dart';

class ItemDetailsPlaceHolder extends StatelessWidget {
  const ItemDetailsPlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: const SingleChildScrollView(
        child: Column(
          children: [
            BannerPlaceholder(),
            SizedBox(height: 40),
            TitlePlaceholder(width: 100.0),
            SizedBox(height: 20),
            TitlePlaceholder(width: 200.0),
            SizedBox(height: 20),
            TitlePlaceholder(width: 200.0)
          ],
        ),
      ),
    );
  }
}
