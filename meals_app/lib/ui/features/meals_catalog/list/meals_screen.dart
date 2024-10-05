import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/ui/features/meals_catalog/list/meals_list.dart';

class MealsScreen extends StatelessWidget {
  final String title;
  final List<Meal> Function() fetchMeals;

  const MealsScreen({super.key, required this.title, required this.fetchMeals});

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
    return MealsList(fetchMeals: fetchMeals);
  }
}
