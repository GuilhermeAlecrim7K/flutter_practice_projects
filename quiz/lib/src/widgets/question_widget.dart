import 'package:flutter/material.dart';
import 'package:quiz/src/models/quiz_question_model.dart';

typedef ChooseAnswerCallback = void Function(
  QuizQuestion question,
  String userAnswer,
);

class QuestionWidget extends StatefulWidget {
  final QuizQuestion question;
  final ChooseAnswerCallback? onChooseAnswer;

  const QuestionWidget({
    super.key,
    required this.question,
    this.onChooseAnswer,
  });

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  late final List<String> _shuffledAlternatives;
  @override
  void initState() {
    _shuffledAlternatives = [
      widget.question.alternatives.correctAlternative,
      ...widget.question.alternatives.incorrectAlternatives
    ]..shuffle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
          child: Text(
            widget.question.question,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.white,
                ),
            textAlign: TextAlign.center,
          ),
        ),
        for (final alternative in _shuffledAlternatives)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 4 * 3,
              child: ElevatedButton(
                onPressed: () =>
                    widget.onChooseAnswer?.call(widget.question, alternative),
                child: Text(alternative),
              ),
            ),
          ),
      ],
    );
  }
}
