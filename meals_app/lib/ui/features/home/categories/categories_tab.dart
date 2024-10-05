import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/providers/categories_provider.dart';
import 'package:meals_app/providers/meals_provider.dart';
import 'package:meals_app/ui/features/home/categories/categories_grid.dart';
import 'package:meals_app/ui/features/meals_catalog/list/meals_screen.dart';

class CategoriesTab extends ConsumerStatefulWidget {
  const CategoriesTab({super.key});

  @override
  ConsumerState<CategoriesTab> createState() => _CategoriesTabState();
}

class _CategoriesTabState extends ConsumerState<CategoriesTab> {
  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(categoriesProvider);

    return CategoriesGrid(
        categories: categories,
        onSelectCategory: (category) {
          _goToMealsScreen(context, category);
        });
  }

  void _goToMealsScreen(BuildContext context, Category category) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) {
        return MealsScreen(
            title: category.title,
            fetchMeals: () {
              final meals = ref.read(filteredMealsProvider);
              return meals.where((meal) => meal.categories.contains(category.id)).toList();
            });
      }),
    );
  }
}
