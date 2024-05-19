import 'package:flutter/material.dart';

class AnswerOption extends StatelessWidget {
  const AnswerOption({
    super.key,
    required this.option,
    required this.optionIndex,
    required this.onPressed,
    required this.isSelected,
  });

  final void Function(int optionIndex) onPressed;
  final String option;
  final int optionIndex;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        onPressed(optionIndex);
      },
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 50),
        backgroundColor: const Color.fromRGBO(255, 255, 255, 0.1),
        side: BorderSide(
          width: isSelected ? 3.0 : 2.0,
          color: isSelected
              ? const Color.fromRGBO(255, 235, 17, 0.8)
              : const Color.fromRGBO(255, 255, 255, 0.10),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        textStyle: const TextStyle(fontWeight: FontWeight.normal),
      ),
      child: Text(option),
    );
  }
}
