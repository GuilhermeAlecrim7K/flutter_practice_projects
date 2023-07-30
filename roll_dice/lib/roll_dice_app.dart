import 'package:flutter/material.dart';

class RollDiceApp extends StatelessWidget {
  const RollDiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Roll Dice",
      home: const Placeholder(),
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFEF9A9A),
        ),
      ),
    );
  }
}
