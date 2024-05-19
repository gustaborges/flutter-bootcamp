class QuizQuestion {
  final String question;
  final List<String> answers;
  final int correctAnswerIndex;
  const QuizQuestion(
      {required this.question,
      required this.answers,
      required this.correctAnswerIndex});

  String getAnswer(int answerIndex) {
    return answers[answerIndex];
  }

  String getCorrectAnswer() {
    return answers[correctAnswerIndex];
  }
}
