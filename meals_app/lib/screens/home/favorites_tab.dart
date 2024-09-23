import 'package:flutter/material.dart';
import 'package:meals_app/utils/favorite_meals_manager.dart';
import 'package:meals_app/widgets/meals_list.dart';

class FavoritesTab extends StatefulWidget {
  final FavoriteMealsManager favoritesManager;

  const FavoritesTab({
    super.key,
    required this.favoritesManager,
  });

  @override
  State<FavoritesTab> createState() => _FavoritesTabState();
}

class _FavoritesTabState extends State<FavoritesTab> {
  @override
  Widget build(BuildContext context) {
    return MealsList(
      fetchMeals: () {
        return widget.favoritesManager.getFavorites();
      },
      favoritesManager: widget.favoritesManager,
      shouldRefreshWhenFavoriteChanges: true,
    );
  }
}
