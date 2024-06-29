import 'package:expense_tracker/core/models/category.dart';
import 'package:expense_tracker/core/models/expense.dart';
import 'package:expense_tracker/core/models/expense_category.dart';

class ExpensesRepository {
  final List<Expense> _expenses = [
    Expense(
      description: 'Donuts',
      amount: 9.0,
      currencySymbol: 'R\$',
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      description: 'Black Coffe',
      amount: 4.50,
      date: DateTime.now(),
      currencySymbol: 'R\$',
      category: Category.food,
    ),
  ];

  List<CategoryBucket> getExpensesGroupedByCategory() {
    final categoriesExpenses = <Category, List<Expense>>{};

    for (final expense in _expenses) {
      categoriesExpenses.putIfAbsent(expense.category, () => []);
      categoriesExpenses[expense.category]!.add(expense);
    }

    return categoriesExpenses.entries
        .map((e) => CategoryBucket(e.key, e.value))
        .toList();
  }

  List<Expense> getExpensesOrderedByNewest() {
    var result = List<Expense>.of(_expenses);

    result.sort((exp1, exp2) {
      return exp2.date.compareTo(exp1.date);
    });

    return result;
  }

  void createExpense(Expense expense) {
    _expenses.add(expense);
  }

  void deleteExpense(Expense expense) {
    _expenses.remove(expense);
  }
}

class CategoryExpenses {}
