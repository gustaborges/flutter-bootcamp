class UserAnswers {
  Map<int, int> answers = {};

  int? getSelectedAnswer(int questionIndex) {
    return answers[questionIndex];
  }

  bool hasSelectedAnswer(int questionIndex) {
    return answers.containsKey(questionIndex);
  }

  void saveAnswer(int questionIndex, int selectedAnswerIndex) {
    answers[questionIndex] = selectedAnswerIndex;
  }
}
