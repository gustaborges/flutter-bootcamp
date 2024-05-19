import 'package:quiz_app/core/model/question.dart';
import 'package:quiz_app/core/data/questions_repository.dart';
import 'package:quiz_app/core/utils/quiz_corrector.dart';
import 'package:quiz_app/core/user_answers.dart';

class Quiz {
  final List<QuizQuestion> _questions;
  final UserAnswers _userAnswers = UserAnswers();
  int _currentQuestionIndex = 0;
  bool started = false;

  int get questionsCount => _questions.length;
  bool get hasNextQuestion => currentQuestionIndex < _questions.length - 1;
  bool get hasPreviousQuestion => currentQuestionIndex > 0;
  int get currentQuestionIndex => _currentQuestionIndex;
  bool get isQuestionAnswered =>
      _userAnswers.hasSelectedAnswer(currentQuestionIndex);

  Quiz(this._questions);

  factory Quiz.randomTopic(int totalQuestions) {
    List<QuizQuestion> questions =
        QuestionsRepository().getQuestions(totalQuestions);

    return Quiz(questions);
  }

  int? getSelectedAnswerIndex() {
    return _userAnswers.getSelectedAnswer(currentQuestionIndex);
  }

  void saveAnswer(int selectedAnswerIndex) {
    return _userAnswers.saveAnswer(currentQuestionIndex, selectedAnswerIndex);
  }

  QuizCorrection checkAnswers() {
    return QuizCorrector.checkAnswers(_questions, _userAnswers);
  }

  QuizQuestion start() {
    if (started) {
      throw Exception('Quiz already started');
    }

    started = true;
    return _questions[_currentQuestionIndex];
  }

  QuizQuestion getNextQuestion() {
    if (!hasNextQuestion) {
      throw Exception();
    }

    return _questions[++_currentQuestionIndex];
  }

  QuizQuestion getPreviousQuestion() {
    if (!hasPreviousQuestion) {
      throw Exception();
    }

    return _questions[--_currentQuestionIndex];
  }
}
