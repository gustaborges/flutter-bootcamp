import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/categories_grid.dart';

class CategoriesScreen extends StatelessWidget {
  final String title;
  final List<Category> categories;

  const CategoriesScreen({
    super.key,
    required this.title,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: CategoriesGrid(
          categories: categories,
          onSelectCategory: (category) {
            _goToMealsScreen(context, category);
          }),
    );
  }

  void _goToMealsScreen(BuildContext context, Category category) {
    final filteredMeals = dummyMeals
        .where((element) => element.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) {
        return MealsScreen(
          title: category.title,
          meals: filteredMeals,
        );
      }),
    );
  }
}
