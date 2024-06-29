import 'package:expense_tracker/core/models/category.dart';
import 'package:expense_tracker/core/models/expense.dart';

class CategoryBucket {
  CategoryBucket(this.category, this.expenses);

  final Category category;
  final List<Expense> expenses;

  double get totalAmount => expenses.fold(
      0, (previousValue, expense) => expense.amount + previousValue);
}
