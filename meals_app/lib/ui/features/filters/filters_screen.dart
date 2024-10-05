import 'package:flutter/material.dart';
import 'package:meals_app/ui/features/filters/filter_switch.dart';
import 'package:meals_app/utils/filter.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: const Column(
        children: [
          FilterSwitch(
            title: 'Gluten-free',
            subtitle: 'Only include gluten-free meals.',
            filter: Filter.glutenFree,
          ),
          FilterSwitch(
            title: 'Lactose-free',
            subtitle: 'Only include lactose-free meals.',
            filter: Filter.lactoseFree,
          ),
          FilterSwitch(
            title: 'Vegetarian',
            subtitle: 'Only include vegetarian meals.',
            filter: Filter.vegetarian,
          ),
          FilterSwitch(
            title: 'Vegan',
            subtitle: 'Only include vegan meals.',
            filter: Filter.vegan,
          ),
        ],
      ),
    );
  }
}
