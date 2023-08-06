import 'package:flutter/material.dart';
import 'package:quiz/src/pages/home_page.dart';
import 'package:quiz/src/shared/app_colors.dart';
import 'package:quiz/src/widgets/gradient_container.dart';

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Quiz",
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.fernGreen),
      ),
      home: const Scaffold(
        body: GradientContainer(
          colors: AppColors.gradientColors,
          child: HomePage(),
        ),
      ),
    );
  }
}
