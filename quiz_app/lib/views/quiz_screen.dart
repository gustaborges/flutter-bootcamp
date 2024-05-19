import 'package:flutter/material.dart';
import 'package:quiz_app/common/styles.dart';
import 'package:quiz_app/controllers/quiz_result_controller.dart';
import 'package:quiz_app/core/model/question.dart';
import 'package:quiz_app/core/quiz.dart';
import 'package:quiz_app/fragments/quiz_screen/answer_selector.dart';
import 'package:quiz_app/fragments/quiz_screen/question_presenter.dart';
import 'package:quiz_app/fragments/quiz_screen/questions_navigator.dart';
import 'package:quiz_app/fragments/quiz_screen/quiz_progress.dart';

class QuizScreen extends StatefulWidget {
  final Quiz quiz;

  const QuizScreen(this.quiz, {super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizScreenState();
  }
}

class _QuizScreenState extends State<QuizScreen> {
  late QuizQuestion currentQuestion;

  _QuizScreenState();

  @override
  void initState() {
    super.initState();
    currentQuestion = widget.quiz.start();
  }

  void showPreviousQuestion() {
    if (!widget.quiz.hasPreviousQuestion) return;

    setState(() {
      currentQuestion = widget.quiz.getPreviousQuestion();
    });
  }

  void showNextQuestion() {
    if (!widget.quiz.hasNextQuestion) return;

    setState(() {
      currentQuestion = widget.quiz.getNextQuestion();
    });
  }

  void viewResults() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => QuizResultController(widget.quiz),
      ),
    );
  }

  void saveAnswerToCurrentQuestion(int answerIndex) {
    setState(() {
      widget.quiz.saveAnswer(answerIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: Styles.primaryGradient),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                QuizProgress(
                  currentQuestion: widget.quiz.currentQuestionIndex + 1,
                  totalQuestions: widget.quiz.questionsCount,
                ),
                QuestionPresenter(currentQuestion.question),
                AnswerSelector(
                  answerOptions: currentQuestion.answers,
                  onAnswerSelected: saveAnswerToCurrentQuestion,
                  selectedOptionIndex: widget.quiz.getSelectedAnswerIndex(),
                ),
                const SizedBox(height: 40),
                QuestionsNavigator(
                  onNavigateBack: showPreviousQuestion,
                  onNavigateForward: showNextQuestion,
                  onFinish: viewResults,
                  totalQuestions: widget.quiz.questionsCount,
                  currentQuestion: widget.quiz.currentQuestionIndex + 1,
                  enableNavigateBackwardButton: widget.quiz.hasPreviousQuestion,
                  enableNavigateForwardButton: widget.quiz.isQuestionAnswered,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
