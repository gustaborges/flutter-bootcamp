import 'package:flutter/material.dart';
import 'package:meals_app/utils/filter.dart';
import 'package:meals_app/utils/filters_manager.dart';

class FilterSwitch extends StatefulWidget {
  final String title;
  final String subtitle;
  final Filter filter;
  final FiltersManager filtersManager;

  const FilterSwitch({
    required this.title,
    required this.subtitle,
    required this.filter,
    required this.filtersManager,
    super.key,
  });

  @override
  State<FilterSwitch> createState() => _FilterSwitchState();
}

class _FilterSwitchState extends State<FilterSwitch> {
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(
        widget.title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onSurface),
      ),
      subtitle: Text(
        widget.subtitle,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Theme.of(context).colorScheme.onSurface),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 30, right: 22),
      value: widget.filtersManager.isActive(widget.filter),
      onChanged: (isChecked) {
        setState(() {
          widget.filtersManager.setValue(widget.filter, isChecked);
        });
      },
    );
  }
}
