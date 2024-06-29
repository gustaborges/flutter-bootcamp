import 'package:expense_tracker/core/models/expense.dart';
import 'package:flutter/material.dart';
import 'expense_list_item.dart';

class ExpensesList extends StatelessWidget {
  final List<Expense> expenses;
  final void Function() onRefresh;
  final void Function(Expense) onExpenseDismissed;

  const ExpensesList(
      {super.key,
      required this.expenses,
      required this.onExpenseDismissed,
      required this.onRefresh});

  Future<void> handleRefresh() async {
    onRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: handleRefresh,
      child: ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Dismissible(
              key: ValueKey(expenses[i]),
              child: ExpenseListItem(expenses[i]),
              onDismissed: (direction) {
                onExpenseDismissed(expenses[i]);
              },
            ),
          );
        },
      ),
    );
  }
}
