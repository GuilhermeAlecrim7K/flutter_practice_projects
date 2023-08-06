import 'package:flutter/material.dart';
import 'package:quiz/src/data/questions.dart';
import 'package:quiz/src/models/quiz_question_model.dart';
import 'package:quiz/src/widgets/question_widget.dart';

typedef OnFinishQuestions = void Function(
  List<QuizQuestion> questionsAnswered,
  List<String> userAnswers,
);

class QuizQuestionsPage extends StatefulWidget {
  final OnFinishQuestions? finishQuestions;
  const QuizQuestionsPage({super.key, this.finishQuestions});

  @override
  State<QuizQuestionsPage> createState() => _QuizQuestionsPageState();
}

class _QuizQuestionsPageState extends State<QuizQuestionsPage> {
  int _currentQuestionIndex = 0;
  final List<String> _userAnswers = List.filled(questions.length, '');

  void _onChooseAnswer(QuizQuestion question, String userAnswer) {
    _currentQuestionIndex = questions
        .indexWhere((element) => element.question == question.question);
    _userAnswers[_currentQuestionIndex] = userAnswer;
    debugPrint('${question.question} - $userAnswer');
    _goToNextPage();
  }

  void _goToNextPage() {
    if (_currentQuestionIndex < questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    } else {
      widget.finishQuestions?.call(questions, _userAnswers);
    }
  }

  @override
  Widget build(BuildContext context) {
    return QuestionWidget(
      key: ValueKey(questions[_currentQuestionIndex].question),
      question: questions[_currentQuestionIndex],
      onChooseAnswer: _onChooseAnswer,
    );
  }
}
