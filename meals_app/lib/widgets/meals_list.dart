import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_details_screen.dart';
import 'package:meals_app/widgets/meal_list_item.dart';

class MealsList extends StatelessWidget {
  final List<Meal> meals;

  const MealsList(
    this.meals, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: meals.length,
      itemBuilder: (BuildContext context, int index) {
        return MealListItem(
          meal: meals[index],
          onSelectMeal: (meal) {
            _goToMealDetailScreen(context, meal);
          },
        );
      },
    );
  }

  void _goToMealDetailScreen(BuildContext context, Meal meal) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return MealDetailsScreen(
        title: meal.title,
        meal: meal,
      );
    }));
  }
}
