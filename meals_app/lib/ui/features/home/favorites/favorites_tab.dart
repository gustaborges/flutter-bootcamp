import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/favorites_notifier_provider.dart';
import 'package:meals_app/ui/features/meals_catalog/list/meals_list.dart';

class FavoritesTab extends ConsumerStatefulWidget {
  const FavoritesTab({super.key});

  @override
  ConsumerState<FavoritesTab> createState() => _FavoritesTabState();
}

class _FavoritesTabState extends ConsumerState<FavoritesTab> {
  @override
  Widget build(BuildContext context) {
    return MealsList(
      fetchMeals: () {
        var favorites = ref.read(favoritesProvider);
        return favorites;
      },
      shouldRefreshWhenFavoriteChanges: true,
    );
  }
}
