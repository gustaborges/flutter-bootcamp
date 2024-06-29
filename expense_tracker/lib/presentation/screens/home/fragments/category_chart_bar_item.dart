import 'package:expense_tracker/core/models/category.dart';
import 'package:expense_tracker/core/models/expense_category.dart';
import 'package:flutter/material.dart';

class CategoryChartBarItem extends StatelessWidget {
  const CategoryChartBarItem({
    super.key,
    required this.category,
    required this.maxTotalAmount,
  });

  final CategoryBucket category;
  final double maxTotalAmount;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 80,
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(
            child: FractionallySizedBox(
              heightFactor: category.totalAmount / maxTotalAmount,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(8)),
                ),
                child: Center(
                  child: Text(
                    category.totalAmount.toStringAsFixed(2),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Icon(category.category.getIcon())
        ],
      ),
    );
  }
}
