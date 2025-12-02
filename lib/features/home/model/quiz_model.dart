class QuizModel {
  final String question;
  final Map<String, bool> answers;

  QuizModel({required this.question, required this.answers});
}

final List<QuizModel> quizData = [
  QuizModel(
    question: 'What is the capital of France?',
    answers: {'Berlin': false, 'Madrid': false, 'Paris': true, 'Rome': false},
  ),
  QuizModel(
    question: 'Which planet is known as the Red Planet?',
    answers: {'Earth': false, 'Mars': true, 'Saturn': false},
  ),
  QuizModel(
    question: 'Who wrote "Hamlet"?',
    answers: {
      'Charles Dickens': false,
      'Leo Tolstoy': false,
      'William Shakespeare': true,
      'Mark Twain': false,
    },
  ),
  QuizModel(
    question: 'Is the Pacific Ocean the largest ocean on Earth?',
    answers: {'true': true, 'false': false},
  ),
  QuizModel(
    question: 'What is the chemical symbol for gold?',
    answers: {'Au': true, 'Ag': false, 'Fe': false, 'Pb': false},
  ),
];
