import 'package:flutter/material.dart';

class AnswerPresenter extends StatelessWidget {
  final String header;
  final String answer;
  final bool isCorrect;

  const AnswerPresenter(
      {super.key,
      required this.header,
      required this.answer,
      required this.isCorrect});

  @override
  Widget build(BuildContext context) {
    final icon = resolveIcon();

    return Wrap(
      children: [
        Text(
          header,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: icon,
            ),
            Flexible(
              child: Text(
                answer,
                style: const TextStyle(color: Colors.white),
                softWrap: true,
              ),
            )
          ],
        ),
      ],
    );
  }

  Icon resolveIcon() {
    if (isCorrect) {
      return const Icon(
        Icons.check,
        color: Color.fromARGB(255, 107, 220, 135),
      );
    }

    return const Icon(
      Icons.thumb_down_alt_outlined,
      color: Color.fromARGB(255, 255, 92, 92),
    );
  }
}
