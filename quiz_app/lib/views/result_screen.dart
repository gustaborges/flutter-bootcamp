import 'package:flutter/material.dart';
import 'package:quiz_app/common/styles.dart';
import 'package:quiz_app/components/rectangular_button.dart';
import 'package:quiz_app/core/utils/quiz_corrector.dart';
import 'package:quiz_app/fragments/home_screen/logo.dart';
import 'package:quiz_app/fragments/result_screen/question_correction_presenter.dart';
import 'package:quiz_app/views/home_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.quizCorrection, {super.key});

  final QuizCorrection quizCorrection;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: Styles.primaryGradient),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Logo(width: 80),
                  const SizedBox(height: 25),
                  const Text(
                    'Your Results',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: quizCorrection.questions.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: QuestionCorrectionPresenter(
                            quizCorrection.questions[index],
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 15),
                    child: RectangularButton(
                      label: 'Continue',
                      icon: const Icon(Icons.check),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
