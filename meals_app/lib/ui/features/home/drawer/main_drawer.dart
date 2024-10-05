import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/filters_notifier_provider.dart';

class MainDrawer extends ConsumerWidget {
  final void Function(String identifier) onDrawerItemSelected;

  const MainDrawer({
    super.key,
    required this.onDrawerItemSelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: Column(
        children: [
          _buildDrawerHeader(context),
          ..._buildDrawerContent(context, ref),
        ],
      ),
    );
  }

  List<Widget> _buildDrawerContent(BuildContext context, WidgetRef ref) {
    final filters = ref.watch(filtersProvider.notifier);
    final activeFiltersCount = filters.countActiveFilters();

    return [
      // Meals Menu Entry
      ListTile(
        leading: Icon(
          Icons.restaurant,
          size: 26,
          color: Theme.of(context).colorScheme.onSurface,
        ),
        title: Text(
          'Meals',
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 24,
              ),
        ),
        onTap: () {
          onDrawerItemSelected('meals');
        },
      ),
      // Filters Menu Entry
      ListTile(
        leading: Icon(
          Icons.settings,
          size: 26,
          color: Theme.of(context).colorScheme.onSurface,
        ),
        title: Text(
          'Filters',
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 24,
              ),
        ),
        trailing: Badge.count(
          count: activeFiltersCount,
          isLabelVisible: activeFiltersCount > 0,
          largeSize: 25,
          textStyle: Theme.of(context).textTheme.labelLarge,
        ),
        onTap: () {
          onDrawerItemSelected('filters');
        },
      ),
    ];
  }

  DrawerHeader _buildDrawerHeader(BuildContext context) {
    return DrawerHeader(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).colorScheme.primaryContainer,
            Theme.of(context).colorScheme.primaryContainer.withOpacity(0.6)
          ],
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.fastfood,
            size: 48,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(width: 18),
          Text(
            'Cooking Up!',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
        ],
      ),
    );
  }
}
