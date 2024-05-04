import 'package:flutter/material.dart';
import 'package:food_recipe/features/presentation/widgets/shimmer/placeholers.dart';
import 'package:shimmer/shimmer.dart';

class ListItemPlaceHolder extends StatelessWidget {
  const ListItemPlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: ContentPlaceholder(lineType: ContentLineType.threeLines),
      ),
    );
  }
}
