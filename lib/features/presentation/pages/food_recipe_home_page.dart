import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_recipe/core/utils/constant.dart';
import 'package:food_recipe/features/presentation/pages/food_recipe_search_page.dart';
import 'package:food_recipe/features/presentation/pages/saved_food_recipe_page.dart';

class FoodRecipeHomePage extends StatelessWidget {
  FoodRecipeHomePage({super.key});

  final _selectedIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: _selectedIndex,
      builder: (context, selectedIndex, child) => Scaffold(
        appBar: selectedIndex == 0
            ? AppBar(
                title: SvgPicture.asset(Constant.appLogo),
                centerTitle: true,
              )
            : null,
        body: selectedIndex == 0 ? FoodRecipeSearchPage() : SavedFoodRecipePage(),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: ''),
          ],
          onTap: (int index) {
            _selectedIndex.value = index;
          },
          currentIndex: selectedIndex,
        ),
      ),
    );
  }
}
