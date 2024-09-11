import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/empty_meals_list.dart';
import 'package:meals_app/widgets/meals_list.dart';

class MealsScreen extends StatelessWidget {
  final String title;
  final List<Meal> meals;

  const MealsScreen({super.key, required this.title, required this.meals});

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
    if (meals.isEmpty) {
      return const EmptyMealsList();
    }

    return MealsList(meals);
  }
}
