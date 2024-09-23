import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/screens/home/tabs.dart';
import 'package:meals_app/utils/favorite_meals_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var prefs = await SharedPreferences.getInstance();
  var favoritesManager = FavoriteMealsManager(prefs);
  runApp(MealsApp(favoritesManager: favoritesManager));
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

  const MealsApp({super.key, required this.favoritesManager});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals',
      theme: theme,
      home: Tabs(favoritesManager: favoritesManager),
    );
  }
}
