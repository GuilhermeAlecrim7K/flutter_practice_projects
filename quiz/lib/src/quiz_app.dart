import 'package:flutter/material.dart';
import 'package:quiz/src/models/quiz_question_model.dart';
import 'package:quiz/src/pages/home_page.dart';
import 'package:quiz/src/pages/quiz_questions_page.dart';
import 'package:quiz/src/shared/app_colors.dart';
import 'package:quiz/src/widgets/gradient_container.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  late final QuizQuestionsPage _questionsPage;
  late final HomePage _homePage;
  Widget? _currentPage;

  @override
  void initState() {
    _homePage = HomePage(startQuiz: _startQuiz);
    _questionsPage = QuizQuestionsPage(finishQuestions: _showResults);
    _currentPage = _homePage;
    super.initState();
  }

  void _startQuiz() {
    setState(() {
      _currentPage = _questionsPage;
    });
  }

  void _showResults(List<QuizQuestion> questions, List<String> userAnswers) {
    setState(() {
      _currentPage = const Placeholder();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Quiz",
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.fernGreen),
      ),
      home: Scaffold(
        body: GradientContainer(
          colors: AppColors.gradientColors,
          child: _currentPage,
        ),
      ),
    );
  }
}
