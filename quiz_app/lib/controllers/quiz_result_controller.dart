import 'package:flutter/material.dart';
import 'package:quiz_app/core/quiz.dart';
import 'package:quiz_app/views/result_screen.dart';

class QuizResultController extends StatelessWidget {
  const QuizResultController(this.quiz, {super.key});

  final Quiz quiz;

  @override
  Widget build(BuildContext context) {
    var correction = quiz.checkAnswers();

    return ResultScreen(correction);
  }
}
