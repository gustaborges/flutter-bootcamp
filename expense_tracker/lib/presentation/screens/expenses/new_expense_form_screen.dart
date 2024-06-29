import 'package:expense_tracker/core/models/category.dart';
import 'package:expense_tracker/core/models/expense.dart';
import 'package:expense_tracker/presentation/utils/date_formatter.dart';
import 'package:flutter/material.dart';

import 'date_picker.dart';

class NewExpenseForm extends StatefulWidget {
  final void Function(Expense newExpense) onExpenseSubmitted;

  const NewExpenseForm({
    super.key,
    required this.onExpenseSubmitted,
  });

  @override
  State<StatefulWidget> createState() => _NewExpenseFormState();
}

class _NewExpenseFormState extends State<NewExpenseForm> {
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();
  int? _selectedCategory;
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    const separator = SizedBox(height: 35);
    var categories = Category.values
        .map((category) => DropdownMenuItem(
              value: category.index,
              child: Text(category.name),
            ))
        .toList();

    var keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return SizedBox.expand(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              right: 15, left: 15, top: 15, bottom: keyboardHeight + 15),
          child: Column(
            children: [
              const Text(
                'New expense',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              separator,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: buildAmountField(),
                  ),
                  Expanded(
                    child: DatePicker(
                      onDateSelected: (value) => _selectedDate = value,
                    ),
                  ),
                ],
              ),
              separator,
              buildDescriptionField(),
              separator,
              DropdownButton(
                items: categories,
                value: _selectedCategory,
                hint: const Text('Select category'),
                isExpanded: true,
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }

                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),
              separator,
              buildFormFooter(context)
            ],
          ),
        ),
      ),
    );
  }

  TextField buildAmountField() {
    return TextField(
      controller: _amountController,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      autofocus: true,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Amount',
        prefixText: '\$ ',
      ),
    );
  }

  TextField buildDescriptionField() {
    return TextField(
      controller: _descriptionController,
      maxLength: 100,
      maxLines: 10,
      minLines: 1,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Enter a title for this expense',
        labelText: 'Title',
        hintMaxLines: 5,
        icon: Icon(Icons.comment),
      ),
    );
  }

  Row buildFormFooter(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            Navigator.pop(context, false);
          },
          child: const Text('Cancel'),
        ),
        const SizedBox(width: 20),
        OutlinedButton(
          onPressed: () => _submitNewExpense(context),
          child: const Text('Done'),
        ),
      ],
    );
  }

  void _submitNewExpense(BuildContext context) {
    bool isDescriptionEmpty = _descriptionController.text.trim().isEmpty;
    bool isInvalidAmount = (double.tryParse(_amountController.text) ?? 0) <= 0;
    bool isCategoryEmpty = _selectedCategory == null;
    bool isDateEmpty = _selectedDate == null;

    if (isDescriptionEmpty ||
        isInvalidAmount ||
        isCategoryEmpty ||
        isDateEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid input'),
          content: const Text(
              'Please make sure a valid amount, description, date and category was entered.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            )
          ],
        ),
      );
      return;
    }

    var expense = Expense(
      description: _descriptionController.text.trim(),
      amount: double.parse(_amountController.text),
      date: _selectedDate!,
      category: Category.values[_selectedCategory!],
      currencySymbol: 'R\$',
    );

    widget.onExpenseSubmitted(expense);
    Navigator.pop(context, true);
  }

  @override
  void dispose() {
    _amountController.dispose();
    _descriptionController.dispose();
    _selectedCategory = 0;
    super.dispose();
  }
}
