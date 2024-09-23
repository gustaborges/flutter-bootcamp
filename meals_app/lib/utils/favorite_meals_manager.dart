import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteMealsManager {
  static const String key = 'favorite_meals';
  final SharedPreferences prefs;

  FavoriteMealsManager(this.prefs);

  void addFavorite(String mealId) {
    var favorites = getFavoriteIds();
    favorites.add(mealId);

    prefs.setStringList(key, favorites);
  }

  List<String> getFavoriteIds() {
    return prefs.getStringList(key) ?? [];
  }

  List<Meal> getFavorites() {
    var favorites = getFavoriteIds();
    return dummyMeals.where((x) => favorites.contains(x.id)).toList();
  }

  bool isFavorite(String mealId) {
    return getFavoriteIds().contains(mealId);
  }

  void removeFavorite(String mealId) {
    var favorites = getFavoriteIds();
    favorites.remove(mealId);

    prefs.setStringList(key, favorites);
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
