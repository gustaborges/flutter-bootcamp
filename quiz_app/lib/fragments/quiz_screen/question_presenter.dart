import 'package:flutter/material.dart';

class QuestionPresenter extends StatelessWidget {
  final String question;

  const QuestionPresenter(this.question, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: 80,
          maxHeight: 200,
          minWidth: double.infinity,
        ),
        child: Center(
          heightFactor: 0,
          child: Text(
            question,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
