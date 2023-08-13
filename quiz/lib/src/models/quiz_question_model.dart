import 'package:quiz/src/models/quiz_question_alternative_model.dart';

class QuizQuestion {
  final String question;
  final QuizQuestionAlternatives alternatives;
  const QuizQuestion({
    required this.question,
    required this.alternatives,
  });
}
