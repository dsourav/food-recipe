import 'package:flutter/material.dart';

abstract class FoodRecipeTheme {
  static ThemeData get theme => ThemeData(
      scaffoldBackgroundColor: AppColor.whiteLight,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      useMaterial3: true,
      inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          hintStyle: const TextStyle(fontWeight: FontWeight.normal)));
}

abstract class AppColor {
  static Color get whiteLight => const Color.fromRGBO(240, 240, 240, 1);
}
