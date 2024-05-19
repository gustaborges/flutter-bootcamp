import 'package:quiz_app/core/model/question.dart';
import 'package:quiz_app/core/user_answers.dart';

class QuizCorrector {
  static QuizCorrection checkAnswers(
      List<QuizQuestion> questions, UserAnswers userAnswers) {
    var correctedQuestions = <QuestionCorrection>[];

    for (int i = 0; i < questions.length; i++) {
      int selectedAnswer = userAnswers.getSelectedAnswer(i)!;
      correctedQuestions.add(QuestionCorrection(questions[i], selectedAnswer));
    }

    return QuizCorrection(correctedQuestions);
  }
}

class QuizCorrection {
  final List<QuestionCorrection> questions;

  int get correctAnswersCount {
    return questions.where((question) => question.isAnswerCorrect).length;
  }

  int get incorrectAnswersCount {
    return questions.length - correctAnswersCount;
  }

  QuizCorrection(this.questions);
}

class QuestionCorrection {
  final String question;
  final String correctAnswer;
  final String selectedAnswer;
  final bool isAnswerCorrect;

  QuestionCorrection(QuizQuestion quizQuestion, int selectedAnswerIndex)
      : question = quizQuestion.question,
        selectedAnswer = quizQuestion.getAnswer(selectedAnswerIndex),
        correctAnswer = quizQuestion.getCorrectAnswer(),
        isAnswerCorrect =
            quizQuestion.correctAnswerIndex == selectedAnswerIndex;
}
