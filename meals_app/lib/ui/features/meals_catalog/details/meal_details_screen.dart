import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/ui/features/meals_catalog/details/favorite_meal_button.dart';
import 'package:meals_app/utils/favorite_meals_manager.dart';

class MealDetailsScreen extends StatefulWidget {
  final String title;
  final Meal meal;
  final FavoriteMealsManager favoritesManager;

  const MealDetailsScreen({
    super.key,
    required this.title,
    required this.meal,
    required this.favoritesManager,
  });

  @override
  State<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  bool _favoriteHasChanged = false;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        Navigator.of(context).pop(_favoriteHasChanged ? 'refresh' : null);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            FavoriteMealButton(
              mealId: widget.meal.id,
              onToggleFavorite: () {
                _favoriteHasChanged = true;
              },
              favoritesManager: widget.favoritesManager,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image(
                image: NetworkImage(widget.meal.imageUrl),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  'Ingredients',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold),
                ),
              ),
              for (final ingredient in widget.meal.ingredients)
                Text(
                  ingredient,
                  style:
                      Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.onSurface),
                ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  'Steps',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold),
                ),
              ),
              for (int i = 0; i < widget.meal.steps.length; i++)
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    '${i + 1}. ${widget.meal.steps[i]}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Theme.of(context).colorScheme.onSurface),
                  ),
                ),
              const SizedBox(height: 30)
            ],
          ),
        ),
      ),
    );
  }
}
