import 'package:expense_tracker/core/models/category.dart';
import 'package:expense_tracker/core/models/expense.dart';
import 'package:expense_tracker/presentation/utils/date_formatter.dart';
import 'package:flutter/material.dart';

class ExpenseListItem extends StatelessWidget {
  const ExpenseListItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    var categoryIcon = expense.category.getIcon();

    return Card(
      child: Padding(
          padding:
              const EdgeInsets.only(left: 15, bottom: 15, top: 15, right: 15),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(
                  categoryIcon,
                  size: 30,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      expense.description,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            '${expense.currencySymbol} ${expense.amount.toStringAsFixed(2)}'),
                        Text(dateFormatter.format(expense.date)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
