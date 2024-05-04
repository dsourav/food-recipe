// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeDetailsModel _$RecipeDetailsModelFromJson(Map<String, dynamic> json) =>
    RecipeDetailsModel(
      preparationMinutes: (json['preparationMinutes'] as num).toInt(),
      extendedIngredients: (json['extendedIngredients'] as List<dynamic>)
          .map((e) => ExtendedIngredients.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'] as String,
      instructions: json['instructions'] as String,
      image: json['image'] as String,
    );

ExtendedIngredients _$ExtendedIngredientsFromJson(Map<String, dynamic> json) =>
    ExtendedIngredients(
      original: json['original'] as String,
    );
