import 'package:flutter/material.dart';
import 'package:quiz_app/common/styles.dart';
import 'package:quiz_app/fragments/home_screen/logo.dart';
import 'package:quiz_app/fragments/home_screen/slogan.dart';
import 'package:quiz_app/fragments/home_screen/start_quiz_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: Styles.primaryGradient),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Logo(width: 250),
              SizedBox(height: 50),
              Slogan(),
              SizedBox(height: 50),
              StartQuizButton()
            ],
          ),
        ),
      ),
    );
  }
}
