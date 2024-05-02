import 'package:food_recipe/core/routing/route_path.dart';
import 'package:food_recipe/features/presentation/pages/food_recipe_home_page.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: RoutePath.foodRecipeHome,
        builder: (context, state) => FoodRecipeHomePage(),
      ),
    ],
  );
}
