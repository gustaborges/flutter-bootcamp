import 'package:expense_tracker/core/models/expense.dart';
import 'package:expense_tracker/core/models/expense_category.dart';

class HomeViewData {
  final List<Expense> expenses;
  final List<CategoryBucket> expensesPerCategory;

  HomeViewData({required this.expenses, required this.expensesPerCategory});
}
