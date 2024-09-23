import 'package:flutter/material.dart';
import 'package:meals_app/utils/favorite_meals_manager.dart';

class FavoriteMealButton extends StatefulWidget {
  final String mealId;
  final Function? onToggleFavorite;
  final FavoriteMealsManager favoritesManager;

  const FavoriteMealButton({
    super.key,
    required this.mealId,
    required this.favoritesManager,
    required this.onToggleFavorite,
  });

  @override
  State<FavoriteMealButton> createState() => _FavoriteMealButtonState();
}

class _FavoriteMealButtonState extends State<FavoriteMealButton> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => _toggleFavorite(context),
      icon: Icon(_isFavorite ? Icons.star : Icons.star_border),
    );
  }

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  void _loadFavorites() {
    bool isFavorite = widget.favoritesManager.isFavorite(widget.mealId);

    setState(() {
      _isFavorite = isFavorite;
    });
  }

  void _toggleFavorite(BuildContext context) {
    bool isFavorite =
        widget.favoritesManager.toggleFavoriteAsync(widget.mealId);

    setState(() {
      _isFavorite = isFavorite;
    });

    widget.onToggleFavorite?.call();

    if (context.mounted) {
      String toastMessage =
          isFavorite ? 'Added to favorites' : 'Removed from favorites';

      var snackBar = SnackBar(
        content: Text(toastMessage),
        duration: const Duration(seconds: 2),
      );

      var messenger = ScaffoldMessenger.of(context);
      messenger.clearSnackBars();
      messenger.showSnackBar(snackBar);
    }
  }
}
