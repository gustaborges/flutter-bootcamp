import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/ui/features/home/categories/category_grid_item.dart';

class CategoriesGrid extends StatelessWidget {
  final List<Category> categories;
  final void Function(Category category) onSelectCategory;

  const CategoriesGrid({
    super.key,
    required this.categories,
    required this.onSelectCategory,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(15),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        childAspectRatio: 3 / 2,
      ),
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) {
        return CategoryGridItem(
          categories[index],
          onSelectCategory: onSelectCategory,
        );
      },
    );
  }
}
