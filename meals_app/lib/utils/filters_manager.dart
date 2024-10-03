import 'package:meals_app/utils/filter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FiltersManager {
  SharedPreferences preferences;

  FiltersManager(this.preferences);

  int countActiveFilters() {
    return Filter.values
        .map((filter) => isActive(filter))
        .where((isActive) => isActive)
        .length;
  }

  bool isActive(Filter filter) {
    return preferences.getBool(filter.key) ?? false;
  }

  void setValue(Filter filter, bool isActive) {
    preferences.setBool(filter.key, isActive);
  }
}
