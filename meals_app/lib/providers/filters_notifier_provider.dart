import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/shared_preferences_provider.dart';
import 'package:meals_app/utils/filter.dart';
import 'package:shared_preferences/shared_preferences.dart';

final filtersProvider = NotifierProvider<FiltersNotifier, Map<Filter, bool>>(() {
  return FiltersNotifier();
});

class FiltersNotifier extends Notifier<Map<Filter, bool>> {
  SharedPreferences? sharedPreferences;

  @override
  Map<Filter, bool> build() {
    var preferences = ref.watch(sharedPreferencesProvider);

    if (!preferences.hasValue) {
      return <Filter, bool>{};
    }

    sharedPreferences = preferences.value!;

    return <Filter, bool>{
      for (var filter in Filter.values) filter: sharedPreferences!.getBool(filter.key) ?? false,
    };
  }

  int countActiveFilters() {
    return Filter.values.where((filter) => isActive(filter)).length;
  }

  bool isActive(Filter filter) {
    return state[filter] ?? false;
  }

  void setValue(Filter filter, bool isActive) {
    if (sharedPreferences == null) return;

    sharedPreferences!.setBool(filter.key, isActive);
    state = {...state, filter: isActive};
  }
}
