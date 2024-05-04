import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe/core/db/local_db.dart';
import 'package:food_recipe/core/di/injectable.dart';
import 'package:food_recipe/core/routing/app_router.dart';
import 'package:food_recipe/core/utils/theme.dart';
import 'package:food_recipe/features/presentation/blocs/food_recipe_search/food_recipe_search_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await Hive.initFlutter();
  LocalDB.registerAdapters();
  await LocalDB.openBox();
  runApp(const FoodRecipeApp());
}

class FoodRecipeApp extends StatelessWidget {
  const FoodRecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FoodRecipeSearchBloc>(
          create: (_) => getIt<FoodRecipeSearchBloc>(),
        )
      ],
      child: MaterialApp.router(
        title: 'Food Recipe',
        theme: FoodRecipeTheme.theme,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
