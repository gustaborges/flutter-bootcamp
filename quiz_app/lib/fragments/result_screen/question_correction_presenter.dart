import 'package:flutter/material.dart';
import 'package:quiz_app/core/utils/quiz_corrector.dart';
import 'package:quiz_app/fragments/result_screen/answer_presenter.dart';

class QuestionCorrectionPresenter extends StatelessWidget {
  final QuestionCorrection correction;

  const QuestionCorrectionPresenter(this.correction, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(30, 255, 255, 255),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              correction.question,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            AnswerPresenter(
              header: 'Your answer',
              answer: correction.selectedAnswer,
              isCorrect: correction.isAnswerCorrect,
            ),
            if (!correction.isAnswerCorrect)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: AnswerPresenter(
                  header: 'Correct answer',
                  answer: correction.correctAnswer,
                  isCorrect: true,
                ),
              )
          ],
        ));
  }
}
