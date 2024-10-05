import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/filters_notifier_provider.dart';
import 'package:meals_app/utils/filter.dart';

class FilterSwitch extends ConsumerStatefulWidget {
  final String title;
  final String subtitle;
  final Filter filter;

  const FilterSwitch({
    required this.title,
    required this.subtitle,
    required this.filter,
    super.key,
  });

  @override
  ConsumerState<FilterSwitch> createState() => _FilterSwitchState();
}

class _FilterSwitchState extends ConsumerState<FilterSwitch> {
  @override
  Widget build(BuildContext context) {
    final filters = ref.watch(filtersProvider);

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
      value: filters[widget.filter] ?? false,
      onChanged: (isChecked) {
        final filters = ref.read(filtersProvider.notifier);
        filters.setValue(widget.filter, isChecked);
      },
    );
  }
}
