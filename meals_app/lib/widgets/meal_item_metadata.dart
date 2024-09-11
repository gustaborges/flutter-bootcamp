import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealItemMetadata extends StatelessWidget {
  final Meal meal;
  final EdgeInsets _traitPadding = const EdgeInsets.symmetric(horizontal: 8);

  const MealItemMetadata(this.meal, {super.key});

  String get affordabilityText => firstLetterUppercase(meal.affordability.name);
  String get complexityText => firstLetterUppercase(meal.complexity.name);
  String get durationText => '${meal.duration} min';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        MealItemTrait(
          label: durationText,
          icon: Icons.schedule,
          padding: _traitPadding,
        ),
        MealItemTrait(
          label: complexityText,
          icon: Icons.work,
          padding: _traitPadding,
        ),
        MealItemTrait(
          label: affordabilityText,
          icon: Icons.attach_money,
          padding: _traitPadding,
        ),
      ],
    );
  }

  firstLetterUppercase(String text) {
    return text[0].toUpperCase() + text.substring(1);
  }
}

class MealItemTrait extends StatelessWidget {
  final String label;
  final IconData icon;
  final EdgeInsets? padding;

  const MealItemTrait({
    super.key,
    required this.label,
    required this.icon,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: Row(
        children: [
          Text(
            label,
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: Colors.white),
          ),
          const SizedBox(width: 5),
          Icon(
            icon,
            size: 18,
          ),
        ],
      ),
    );
  }
}
