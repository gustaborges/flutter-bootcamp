import 'package:expense_tracker/core/models/expense.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/presentation/screens/home/fragments/categories_expenses_chart.dart';
import 'package:expense_tracker/presentation/screens/home/fragments/expenses_list.dart';
import 'package:expense_tracker/presentation/screens/expenses/new_expense_form_screen.dart';
import 'package:expense_tracker/presentation/screens/home/home_view_data.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  final HomeViewData Function() getViewData;
  final void Function(Expense) createExpense;
  final void Function(Expense) deleteExpense;

  const HomeScreen({
    super.key,
    required this.getViewData,
    required this.createExpense,
    required this.deleteExpense,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeViewData _viewData;

  void _showNewExpenseModal(BuildContext context) {
    showModalBottomSheet(
      useSafeArea: true,
      context: context,
      builder: (ctx) => NewExpenseForm(
        onExpenseSubmitted: widget.createExpense,
      ),
      showDragHandle: true,
      isScrollControlled: true,
    ).then((value) {
      if (value == true) {
        _refreshViewData();
      }
    });
  }

  void _removeExpense(Expense expense) {
    widget.deleteExpense(expense);
    _refreshViewData();
    _showExpenseRemovedSnackbar(expense);
  }

  void _showExpenseRemovedSnackbar(Expense expense) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Expense ${expense.id} removed'),
        showCloseIcon: true,
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            widget.createExpense(expense);
            _refreshViewData();
          },
        ),
      ),
    );
  }

  void _refreshViewData({bool updateState = true}) {
    _viewData = widget.getViewData();

    if (updateState) {
      setState(() {});
    }
  }

  @override
  void initState() {
    _refreshViewData(updateState: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = _resolveMainContent();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses'),
        actions: [
          IconButton(
            onPressed: () => _showNewExpenseModal(context),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
        child: mainContent,
      ),
    );
  }

  Widget _resolveMainContent() {
    if (_viewData.expenses.isEmpty) {
      return const Center(
        child: Text('No expense has been added. Start adding some!'),
      );
    }
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return _buildPortraitMainContent();
        }

        return _buildLandscapeMainContent();
      },
    );
  }

  Row _buildLandscapeMainContent() {
    return Row(
      children: [
        Expanded(
          child: CategoriesExpensesChart(_viewData.expensesPerCategory),
        ),
        Expanded(
          flex: 2,
          child: ExpensesList(
            expenses: _viewData.expenses,
            onRefresh: _refreshViewData,
            onExpenseDismissed: _removeExpense,
          ),
        ),
      ],
    );
  }

  Column _buildPortraitMainContent() {
    return Column(
      children: [
        const SizedBox(height: 10),
        SizedBox(
          height: 180,
          width: double.infinity,
          child: CategoriesExpensesChart(_viewData.expensesPerCategory),
        ),
        const SizedBox(height: 5),
        Expanded(
          child: ExpensesList(
            expenses: _viewData.expenses,
            onRefresh: _refreshViewData,
            onExpenseDismissed: _removeExpense,
          ),
        ),
      ],
    );
  }
}
