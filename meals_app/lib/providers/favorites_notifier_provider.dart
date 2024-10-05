import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/meals_provider.dart';
import 'package:meals_app/providers/shared_preferences_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final favoritesProvider = NotifierProvider<FavoritesNotifierProvider, List<Meal>>(() {
  return FavoritesNotifierProvider();
});

class FavoritesNotifierProvider extends Notifier<List<Meal>> {
  static const String key = 'favorite_meals';
  List<Meal> _allMeals = [];
  SharedPreferences? _sharedPreferences;

  void addFavorite(String mealId) {
    var favorites = getFavoriteIds();
    favorites.add(mealId);

    _sharedPreferences?.setStringList(key, favorites);
    ref.invalidateSelf();
  }

  @override
  List<Meal> build() {
    var preferences = ref.watch(sharedPreferencesProvider);
    var meals = ref.watch(allMealsProvider);

    if (!preferences.hasValue) return [];

    _sharedPreferences = preferences.value!;
    _allMeals = meals;

    return getFavorites();
  }

  List<String> getFavoriteIds() {
    return _sharedPreferences?.getStringList(key) ?? [];
  }

  List<Meal> getFavorites() {
    var favorites = getFavoriteIds();
    return _allMeals.where((x) => favorites.contains(x.id)).toList();
  }

  bool isFavorite(String mealId) {
    return getFavoriteIds().contains(mealId);
  }

  void removeFavorite(String mealId) {
    var favorites = getFavoriteIds();
    favorites.remove(mealId);

    _sharedPreferences?.setStringList(key, favorites);
    ref.invalidateSelf();
  }

  bool toggleFavoriteAsync(String mealId) {
    bool favorite = false;

    if (isFavorite(mealId)) {
      removeFavorite(mealId);
    } else {
      addFavorite(mealId);
      favorite = true;
    }

    return favorite;
  }
}
