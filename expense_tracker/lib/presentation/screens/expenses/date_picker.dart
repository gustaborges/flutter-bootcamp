import 'package:expense_tracker/presentation/utils/date_formatter.dart';
import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({super.key, required this.onDateSelected});
  final void Function(DateTime? selectedDate) onDateSelected;

  @override
  State<StatefulWidget> createState() {
    return _DatePickerState();
  }
}

class _DatePickerState extends State<DatePicker> {
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          _selectedDate == null
              ? 'No date selected'
              : dateFormatter.format(_selectedDate!),
        ),
        IconButton(
          onPressed: _presentDatePicker,
          icon: const Icon(Icons.date_range),
        )
      ],
    );
  }

  void _presentDatePicker() {
    var now = DateTime.now();

    showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(1970),
      lastDate: DateTime(now.year + 3, 12, 31),
    ).then((value) {
      setState(() => _selectedDate = value);
      widget.onDateSelected(value);
    });
  }
}
