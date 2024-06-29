import 'package:expense_tracker/core/models/expense_category.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/presentation/screens/home/fragments/category_chart_bar_item.dart';

class CategoriesExpensesChart extends StatelessWidget {
  final List<CategoryBucket> categories;

  const CategoriesExpensesChart(this.categories, {super.key});

  @override
  Widget build(BuildContext context) {
    final double maxTotalAmount = categories.fold(
        0, (previousValue, category) => category.totalAmount + previousValue);

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return CategoryChartBarItem(
          category: categories[index],
          maxTotalAmount: maxTotalAmount,
        );
      },
    );
  }
}
