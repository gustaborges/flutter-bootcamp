import 'package:flutter/material.dart';
import 'package:quiz_app/fragments/quiz_screen/answer_option.dart';

class AnswerSelector extends StatelessWidget {
  final List<String> answerOptions;
  final int? selectedOptionIndex;
  final Function(int optionIndex) onAnswerSelected;

  const AnswerSelector(
      {super.key,
      required this.answerOptions,
      required this.onAnswerSelected,
      required this.selectedOptionIndex});

  @override
  Widget build(BuildContext context) {
    List<Widget> answerOptionsList = [];

    for (int i = 0; i < answerOptions.length; i++) {
      answerOptionsList.add(Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: AnswerOption(
            option: answerOptions[i],
            optionIndex: i,
            onPressed: onAnswerSelected,
            isSelected: selectedOptionIndex == i),
      ));
    }

    return Column(
      children: answerOptionsList,
    );
  }
}
