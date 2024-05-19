import 'package:flutter/material.dart';

class QuizProgress extends StatelessWidget {
  final int currentQuestion;
  final int totalQuestions;

  const QuizProgress({
    super.key,
    required this.currentQuestion,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '$currentQuestion / $totalQuestions',
      style: const TextStyle(color: Colors.white),
    );
  }
}
