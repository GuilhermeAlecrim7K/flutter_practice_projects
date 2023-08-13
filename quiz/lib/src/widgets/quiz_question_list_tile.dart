import 'package:flutter/material.dart';
import 'package:quiz/src/models/quiz_question_model.dart';
import 'package:quiz/src/shared/app_colors.dart';

class QuizQuestionListTile extends StatelessWidget {
  final bool isCorrect;
  final QuizQuestion question;
  final String userAnswer;
  final int questionIndex;
  const QuizQuestionListTile({
    super.key,
    required this.isCorrect,
    required this.question,
    required this.userAnswer,
    required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isCorrect ? colorScheme.primary : colorScheme.error,
          ),
          child: Center(
            child: Text(
              '$questionIndex',
              style: textTheme.labelSmall?.copyWith(
                color: isCorrect ? colorScheme.onPrimary : colorScheme.onError,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                question.question,
                style: textTheme.bodyMedium?.copyWith(
                  color: AppColors.jet,
                ),
              ),
              if (!isCorrect)
                Text(
                  question.alternatives.correctAlternative,
                  style: textTheme.labelSmall?.copyWith(
                    color: colorScheme.primary,
                  ),
                ),
              Text(
                userAnswer,
                style: textTheme.labelSmall?.copyWith(
                  color: isCorrect ? colorScheme.primary : colorScheme.error,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
