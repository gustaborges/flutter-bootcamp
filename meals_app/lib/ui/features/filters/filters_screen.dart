import 'package:flutter/material.dart';
import 'package:meals_app/ui/features/filters/filter_switch.dart';
import 'package:meals_app/utils/filter.dart';
import 'package:meals_app/utils/filters_manager.dart';

class FiltersScreen extends StatelessWidget {
  final FiltersManager filtersManager;

  const FiltersScreen(this.filtersManager, {super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {},
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Your Filters'),
        ),
        body: Column(
          children: [
            FilterSwitch(
              title: 'Gluten-free',
              subtitle: 'Only include gluten-free meals.',
              filter: Filter.glutenFree,
              filtersManager: filtersManager,
            ),
            FilterSwitch(
                title: 'Lactose-free',
                subtitle: 'Only include lactose-free meals.',
                filter: Filter.lactoseFree,
                filtersManager: filtersManager),
            FilterSwitch(
              title: 'Vegetarian',
              subtitle: 'Only include vegetarian meals.',
              filter: Filter.vegetarian,
              filtersManager: filtersManager,
            ),
            FilterSwitch(
              title: 'Vegan',
              subtitle: 'Only include vegan meals.',
              filter: Filter.vegan,
              filtersManager: filtersManager,
            ),
          ],
        ),
      ),
    );
  }
}
