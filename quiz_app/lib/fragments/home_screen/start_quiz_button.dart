import 'package:flutter/material.dart';
import 'package:quiz_app/components/rectangular_button.dart';
import 'package:quiz_app/controllers/quiz_screen_controller.dart';

class StartQuizButton extends StatelessWidget {
  const StartQuizButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RectangularButton(
      label: 'Start quiz',
      icon: const Icon(Icons.arrow_right),
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const QuizController(),
          ),
        );
      },
    );
  }
}
