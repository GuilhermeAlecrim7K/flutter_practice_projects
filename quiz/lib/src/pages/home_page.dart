import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final VoidCallback? startQuiz;
  const HomePage({super.key, this.startQuiz});

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Text(
          'Learn Flutter the fun way!',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: const Color.fromARGB(180, 255, 255, 255),
              ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 50),
        ElevatedButton.icon(
          onPressed: startQuiz,
          label: const Text('Start Quiz'),
          icon: const Icon(Icons.arrow_circle_right_outlined),
        )
      ],
    );
  }
}
