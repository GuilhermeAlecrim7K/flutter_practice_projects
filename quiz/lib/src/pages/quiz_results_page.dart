import 'package:flutter/material.dart';
import 'package:quiz/src/models/quiz_question_model.dart';
import 'package:quiz/src/widgets/quiz_question_list_tile.dart';

class QuizResultsPage extends StatelessWidget {
  final List<QuizQuestion> questions;
  final List<String> userAnswers;
  final VoidCallback? restartQuiz;
  const QuizResultsPage({
    super.key,
    required this.questions,
    required this.userAnswers,
    this.restartQuiz,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(32.0),
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You answered ${_numberOfCorrectAnswers()} out of ${questions.length} correctly!',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.white,
                ),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: ListView.separated(
              itemCount: questions.length,
              itemBuilder: (context, index) {
                return QuizQuestionListTile(
                  isCorrect: _isCorrectAnswer(index),
                  question: questions[index],
                  questionIndex: index,
                  userAnswer: userAnswers[index],
                );
              },
              separatorBuilder: (_, __) => const Divider(height: 15),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton.icon(
            onPressed: restartQuiz,
            icon: const Icon(Icons.restart_alt_rounded),
            label: const Text('Restart Quiz'),
          )
        ],
      ),
    );
  }

  int _numberOfCorrectAnswers() {
    return questions
        .map((question) => question.alternatives.correctAlternative)
        .where((correctAlternative) => userAnswers.contains(correctAlternative))
        .length;
  }

  bool _isCorrectAnswer(int index) {
    return userAnswers[index] ==
        questions[index].alternatives.correctAlternative;
  }
}
