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
                height: 280,
                child: Image(
                  image: AssetImage('assets/images/quiz-logo.png'),
                  color: Color.fromARGB(180, 255, 255, 255),
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                'Learn Flutter the fun way!',
                style: TextStyle(
                  color: Color.fromARGB(180, 255, 255, 255),
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton.icon(
                onPressed: () {},
                label: const Text('Start Quiz'),
                icon: const Icon(Icons.arrow_circle_right_outlined),
              )
            ],
          ),
        ),
      ),
    );
  }
}
