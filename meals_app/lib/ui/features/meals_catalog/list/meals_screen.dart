import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/ui/features/meals_catalog/list/meals_list.dart';
import 'package:meals_app/utils/favorite_meals_manager.dart';

class MealsScreen extends StatelessWidget {
  final String title;
  final List<Meal> meals;
  final FavoriteMealsManager favoritesManager;

  const MealsScreen({super.key, required this.title, required this.meals, required this.favoritesManager});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
        backgroundColor: null,
      ),
      body: resolveBody(),
    );
  }

  Widget resolveBody() {
    return MealsList(
      fetchMeals: () => meals,
      favoritesManager: favoritesManager,
    );
  }
}
