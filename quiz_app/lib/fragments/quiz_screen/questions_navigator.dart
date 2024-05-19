import 'package:flutter/material.dart';

class QuestionsNavigator extends StatelessWidget {
  const QuestionsNavigator(
      {super.key,
      required this.onNavigateBack,
      required this.onNavigateForward,
      required this.onFinish,
      required this.totalQuestions,
      required this.currentQuestion,
      required this.enableNavigateBackwardButton,
      required this.enableNavigateForwardButton});

  final void Function() onNavigateBack;
  final void Function() onNavigateForward;
  final void Function() onFinish;
  final int totalQuestions;
  final int currentQuestion;
  final bool enableNavigateForwardButton;
  final bool enableNavigateBackwardButton;

  bool get isLastQuestion => currentQuestion == totalQuestions;

  @override
  Widget build(BuildContext context) {
    ButtonStyle buttonStyle = OutlinedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: const Color.fromRGBO(0, 0, 0, 0.048),
      disabledForegroundColor: const Color.fromARGB(50, 255, 255, 255),
      disabledBackgroundColor: const Color.fromARGB(10, 0, 0, 0),
      side: const BorderSide(
          width: 3.0, color: Color.fromRGBO(255, 255, 255, 0.10)),
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OutlinedButton(
          onPressed: enableNavigateBackwardButton ? onNavigateBack : null,
          style: buttonStyle,
          child: const Text('Previous'),
        ),
        if (isLastQuestion)
          OutlinedButton(
              onPressed: enableNavigateForwardButton ? onFinish : null,
              style: buttonStyle,
              child: const Text('Finish'))
        else
          OutlinedButton(
              onPressed: enableNavigateForwardButton ? onNavigateForward : null,
              style: buttonStyle,
              child: const Text('Next'))
      ],
    );
  }
}
