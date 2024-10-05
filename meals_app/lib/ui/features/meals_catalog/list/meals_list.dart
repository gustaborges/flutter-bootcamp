import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/ui/common/empty_list_message.dart';
import 'package:meals_app/ui/features/meals_catalog/details/meal_details_screen.dart';
import 'package:meals_app/ui/features/meals_catalog/list/meal_list_item.dart';

class MealsList extends StatefulWidget {
  final List<Meal> Function() fetchMeals;
  final bool shouldRefreshWhenFavoriteChanges;

  const MealsList({
    required this.fetchMeals,
    this.shouldRefreshWhenFavoriteChanges = false,
    super.key,
  });

  @override
  State<MealsList> createState() => _MealsListState();
}

class _MealsListState extends State<MealsList> {
  List<Meal> _meals = [];

  @override
  Widget build(BuildContext context) {
    if (_meals.isEmpty) {
      return const EmptyListMessage(
        title: 'Uh oh... nothing here!',
        subtitle: 'Try selecting a different category',
      );
    }

    return ListView.builder(
      itemCount: _meals.length,
      itemBuilder: (BuildContext context, int index) {
        return MealListItem(
          meal: _meals[index],
          onSelectMeal: (meal) {
            _goToMealDetailScreen(context, meal);
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  Future<void> _goToMealDetailScreen(BuildContext context, Meal meal) async {
    var result = await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) {
        return MealDetailsScreen(
          title: meal.title,
          meal: meal,
        );
      }),
    );

    if (result == 'refresh' && widget.shouldRefreshWhenFavoriteChanges) {
      _refreshData();
    }
  }

  void _refreshData() {
    setState(() {
      _meals = widget.fetchMeals();
    });
  }
}
