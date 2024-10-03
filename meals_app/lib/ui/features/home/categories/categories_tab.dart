import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/ui/features/home/categories/categories_grid.dart';
import 'package:meals_app/ui/features/meals_catalog/list/meals_screen.dart';
import 'package:meals_app/utils/favorite_meals_manager.dart';

class CategoriesTab extends StatelessWidget {
  final List<Category> categories;
  final FavoriteMealsManager favoritesManager;

  const CategoriesTab({super.key, required this.categories, required this.favoritesManager});

  @override
  Widget build(BuildContext context) {
    return CategoriesGrid(
        categories: categories,
        onSelectCategory: (category) {
          _goToMealsScreen(context, category);
        });
  }

  void _goToMealsScreen(BuildContext context, Category category) {
    final filteredMeals = dummyMeals.where((element) => element.categories.contains(category.id)).toList();

    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) {
        return MealsScreen(
          title: category.title,
          meals: filteredMeals,
          favoritesManager: favoritesManager,
        );
      }),
    );
  }
}
