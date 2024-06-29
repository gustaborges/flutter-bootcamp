import 'package:expense_tracker/core/data/expenses_repository.dart';
import 'package:expense_tracker/core/models/expense.dart';
import 'package:expense_tracker/presentation/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/presentation/screens/home/home_view_data.dart';

class HomeController extends StatelessWidget {
  final _repository = ExpensesRepository();

  HomeController({super.key});

  HomeViewData getViewData() {
    var expenses = _repository.getExpensesOrderedByNewest();
    var expensesPerCategory = _repository.getExpensesGroupedByCategory();

    return HomeViewData(
      expenses: expenses,
      expensesPerCategory: expensesPerCategory,
    );
  }

  void createExpense(Expense expense) {
    _repository.createExpense(expense);
  }

  void deleteExpense(Expense expense) {
    _repository.deleteExpense(expense);
  }

  @override
  Widget build(BuildContext context) {
    return HomeScreen(
      getViewData: getViewData,
      createExpense: createExpense,
      deleteExpense: deleteExpense,
    );
  }
}
