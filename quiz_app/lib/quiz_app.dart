import 'package:flutter/material.dart';
import 'views/home_screen.dart';

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
              fontSizeFactor: 1.2,
              fontSizeDelta: 0.0,
            ),
      ),
      home: const HomeScreen(),
    );
  }
}
