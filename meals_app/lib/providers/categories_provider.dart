import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/providers/filters_notifier_provider.dart';
import 'package:meals_app/providers/meals_provider.dart';

final categoriesProvider = NotifierProvider<CategoriesNotifier, List<Category>>(() {
  return CategoriesNotifier();
});

class CategoriesNotifier extends Notifier<List<Category>> {
  @override
  build() {
    ref.watch(filtersProvider);
    final filtersNotifier = ref.read(filtersProvider.notifier);

    if (filtersNotifier.countActiveFilters() == 0) {
      return allCategories;
    }

    final meals = ref.read(filteredMealsProvider);
    final categoriesWithMeals = meals.expand((meal) => meal.categories).toSet();
    return allCategories.where((c) => categoriesWithMeals.contains(c.id)).toList();
  }
}
