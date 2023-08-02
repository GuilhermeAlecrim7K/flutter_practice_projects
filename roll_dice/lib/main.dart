import 'package:flutter/material.dart';
import 'package:roll_dice/roll_dice_app.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const RollDiceApp();
  }
}
