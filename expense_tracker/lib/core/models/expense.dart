import 'package:expense_tracker/core/models/category.dart';
import 'package:uuid/v4.dart';

class Expense {
  final String id;
  final String description;
  final double amount;
  final DateTime date;
  final Category category;
  final String currencySymbol;

  Expense(
      {String? id,
      required this.description,
      required this.amount,
      required this.date,
      required this.category,
      required this.currencySymbol})
      : id = id ?? const UuidV4().generate();
}
