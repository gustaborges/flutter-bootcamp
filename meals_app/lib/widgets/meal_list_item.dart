import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item_metadata.dart';
import 'package:transparent_image/transparent_image.dart';

class MealListItem extends StatelessWidget {
  final Meal meal;
  final void Function(Meal meal) onSelectMeal;

  const MealListItem({
    super.key,
    required this.meal,
    required this.onSelectMeal,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(60)),
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 6,
        horizontal: 12,
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Expanded(
            child: FadeInImage(
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              color: const Color.fromARGB(120, 0, 0, 0),
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  Text(
                    meal.title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 10),
                  MealItemMetadata(meal),
                ],
              ),
            ),
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => onSelectMeal(meal),
                splashColor: const Color.fromARGB(10, 255, 193, 7),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
