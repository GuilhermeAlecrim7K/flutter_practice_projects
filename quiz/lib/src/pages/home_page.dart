import 'package:flutter/material.dart';
import 'package:quiz/src/shared/app_colors.dart';
import 'package:quiz/src/widgets/gradient_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientContainer(
        colors: AppColors.gradientColors,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 250,
                child: Image(
                  image: AssetImage('assets/images/quiz-logo.png'),
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                'Learn Flutter the fun way!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton(onPressed: () {}, child: const Text('Start Quiz'))
            ],
          ),
        ),
      ),
    );
  }
}
