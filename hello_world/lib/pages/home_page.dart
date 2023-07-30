import 'package:flutter/material.dart';
import 'package:hello_world/widgets/gradient_container_widget.dart';
import 'package:hello_world/widgets/styled_text_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: GradientContainer(
        colors: <Color>[
          Colors.red,
          Colors.orange,
          Colors.yellow,
          Colors.green,
          Colors.blue,
          Colors.indigo,
          Colors.purple,
        ],
        child: Center(
          child: StyledText('Hello, world!'),
        ),
      ),
    );
  }
}
