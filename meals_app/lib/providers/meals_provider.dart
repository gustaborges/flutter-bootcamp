import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/filters_notifier_provider.dart';
import 'package:meals_app/utils/filter.dart';

final allMealsProvider = Provider<List<Meal>>((ref) {
  return dummyMeals;
});

final filteredMealsProvider = Provider<List<Meal>>((ref) {
  final filters = ref.watch(filtersProvider);
  final filtersNotifier = ref.read(filtersProvider.notifier);

  bool matchesFilters(Meal meal, Map<Filter, bool> filters) {
    return filters.entries.any(
      (filter) {
        return filter.value == true &&
            switch (filter.key) {
              Filter.glutenFree => meal.isGlutenFree,
              Filter.lactoseFree => meal.isLactoseFree,
              Filter.vegetarian => meal.isVegetarian,
              Filter.vegan => meal.isVegan,
            };
      },
    );
  }

  if (filtersNotifier.countActiveFilters() > 0) {
    var filtered = dummyMeals.where((meal) => matchesFilters(meal, filters)).toList();
    return filtered;
  }

  return dummyMeals;
});
