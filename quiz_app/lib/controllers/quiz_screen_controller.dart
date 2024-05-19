import 'package:flutter/material.dart';
import 'package:quiz_app/core/quiz.dart';
import 'package:quiz_app/views/quiz_screen.dart';

class QuizController extends StatelessWidget {
  const QuizController({super.key});

  @override
  Widget build(BuildContext context) {
    var quiz = Quiz.randomTopic(5);

    return QuizScreen(quiz);
  }
}
