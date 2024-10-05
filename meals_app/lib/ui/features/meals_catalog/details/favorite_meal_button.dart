import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/favorites_notifier_provider.dart';

class FavoriteMealButton extends ConsumerStatefulWidget {
  final String mealId;
  final Function? onToggleFavorite;

  const FavoriteMealButton({
    super.key,
    required this.mealId,
    required this.onToggleFavorite,
  });

  @override
  ConsumerState<FavoriteMealButton> createState() => _FavoriteMealButtonState();
}

class _FavoriteMealButtonState extends ConsumerState<FavoriteMealButton> {
  @override
  Widget build(BuildContext context) {
    ref.watch(favoritesProvider);

    bool isFavorite() {
      final favorites = ref.read(favoritesProvider.notifier);
      return favorites.isFavorite(widget.mealId);
    }

    return IconButton(
      onPressed: () => _toggleFavorite(context),
      icon: Icon(isFavorite() ? Icons.star : Icons.star_border),
    );
  }

  void _toggleFavorite(BuildContext context) {
    final favoritesNotifier = ref.read(favoritesProvider.notifier);
    bool isFavorite = favoritesNotifier.toggleFavoriteAsync(widget.mealId);

    widget.onToggleFavorite?.call();

    if (context.mounted) {
      String toastMessage = isFavorite ? 'Added to favorites' : 'Removed from favorites';

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
