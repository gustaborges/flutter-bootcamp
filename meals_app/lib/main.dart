import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/screens/categories_screen.dart';

void main() {
  runApp(const MealsApp());
}

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

class MealsApp extends StatelessWidget {
  final String e = "";
  final String e2 = "";

  const MealsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals',
      theme: theme,
      home: const CategoriesScreen(
        title: 'Select a category',
        categories: availableCategories,
      ),
    );
  }
}
