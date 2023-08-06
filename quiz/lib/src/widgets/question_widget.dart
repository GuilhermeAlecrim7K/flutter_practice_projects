import 'package:flutter/material.dart';
import 'package:quiz/src/models/quiz_question_model.dart';

typedef ChooseAnswerCallback = void Function(
  QuizQuestion question,
  String userAnswer,
);

class QuestionWidget extends StatelessWidget {
  final QuizQuestion question;
  final bool? shuffleAlternatives;
  final ChooseAnswerCallback? onChooseAnswer;

  const QuestionWidget({
    super.key,
    required this.question,
    this.shuffleAlternatives,
    this.onChooseAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
          child: Text(
            question.question,
            style: const TextStyle(
              fontSize: 26,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        for (final alternative in [
          question.alternatives.correctAlternative,
          ...question.alternatives.incorrectAlternatives
        ]..shuffle())
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 4 * 3,
              child: ElevatedButton(
                onPressed: () => onChooseAnswer?.call(question, alternative),
                child: Text(alternative),
              ),
            ),
          ),
      ],
    );
  }
}
