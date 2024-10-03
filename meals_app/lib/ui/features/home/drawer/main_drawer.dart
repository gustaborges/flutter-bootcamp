import 'package:flutter/material.dart';
import 'package:meals_app/utils/filters_manager.dart';

class MainDrawer extends StatelessWidget {
  final void Function(String identifier) onDrawerItemSelected;
  final FiltersManager filtersManager;

  const MainDrawer({
    super.key,
    required this.onDrawerItemSelected,
    required this.filtersManager,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          _buildDrawerHeader(context),
          ..._buildDrawerContent(context),
        ],
      ),
    );
  }

  List<Widget> _buildDrawerContent(BuildContext context) {
    final filtersCount = filtersManager.countActiveFilters();

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
          count: filtersCount,
          isLabelVisible: filtersCount > 0,
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
