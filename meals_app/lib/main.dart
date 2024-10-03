import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/ui/features/home/tabs.dart';
import 'package:meals_app/utils/favorite_meals_manager.dart';
import 'package:meals_app/utils/filters_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var prefs = await SharedPreferences.getInstance();
  var favoritesManager = FavoriteMealsManager(prefs);
  var filtersManager = FiltersManager(prefs);

  runApp(MealsApp(favoritesManager, filtersManager));
}

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

class MealsApp extends StatelessWidget {
  final FavoriteMealsManager favoritesManager;
  final FiltersManager filtersManager;

  const MealsApp(this.favoritesManager, this.filtersManager, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals',
      theme: theme,
      home: Tabs(favoritesManager: favoritesManager, filtersManager: filtersManager),
    );
  }
}
