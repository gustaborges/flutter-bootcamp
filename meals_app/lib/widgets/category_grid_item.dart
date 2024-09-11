import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  final Category category;
  final void Function(Category category) onSelectCategory;

  const CategoryGridItem(
    this.category, {
    super.key,
    required this.onSelectCategory,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(18);

    return InkWell(
      onTap: () => onSelectCategory(category),
      hoverColor: Theme.of(context).primaryColor,
      borderRadius: borderRadius,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 15),
          child: Text(
            category.title,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
        ),
      ),
    );
  }
}
