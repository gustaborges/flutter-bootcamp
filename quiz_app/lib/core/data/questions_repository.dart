import 'package:quiz_app/core/model/question.dart';

class QuestionsRepository {
  final List<QuizQuestion> _questions = const [
    QuizQuestion(
      question:
          'Normalmente, quantos litros de sangue uma pessoa tem? Em média, quantos são retirados numa doação de sangue?',
      answers: [
        'Tem entre 2 a 4 litros. São retirados 450 mililitros',
        'Tem entre 4 a 6 litros. São retirados 450 mililitros',
        'Tem 10 litros. São retirados 2 litros',
        'Tem 7 litros. São retirados 1,5 litros'
      ],
      correctAnswerIndex: 1,
    ),
    QuizQuestion(
      question: 'De quem é a famosa frase “Penso, logo existo”?',
      answers: [
        'Platão',
        'Galileu Galilei',
        'Descartes',
        'Sócrates',
        'Francis Bacon'
      ],
      correctAnswerIndex: 2,
    ),
    QuizQuestion(
      question:
          'The city of Venice is flooded every four years. The locals call this "high water" or "acqua alta". What would you do during "acqua alta"?',
      answers: [
        'Stroll the piazza without a care in the world. The weather can\'t stop me.',
        'Leave ASAP',
        'Jump in puddles and sing in the rain. I love water! ',
        'Look for a dry place and hang tight until the water recedes ',
      ],
      correctAnswerIndex: 1,
    ),
    QuizQuestion(
      question: 'How do you feel about living on a cruise ship for a year?',
      answers: [
        'Sounds great, sign me up!',
        'Meh, I\'m not sure. Maybe for a week',
        'Cruising is for old people',
        'I\'d spend the rest of my days sailing the seven seas',
      ],
      correctAnswerIndex: 2,
    )
  ];

  List<QuizQuestion> getQuestions(int totalQuestions) {
    return _questions.take(totalQuestions).toList();
  }
}
