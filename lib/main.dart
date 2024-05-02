import 'package:flutter/material.dart';
import 'package:food_recipe/core/di/injectable.dart';
import 'package:food_recipe/core/routing/app_router.dart';
import 'package:food_recipe/core/utils/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const FoodRecipeApp());
}

class FoodRecipeApp extends StatelessWidget {
  const FoodRecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Food Recipe',
      theme: FoodRecipeTheme.theme,
      routerConfig: AppRouter.router,
    );
  }
}
