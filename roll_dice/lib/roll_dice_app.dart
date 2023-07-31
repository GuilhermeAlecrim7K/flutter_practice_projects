import 'package:flutter/material.dart';
import 'package:roll_dice/pages/home_page.dart';
import 'package:roll_dice/shared/app_colors.dart';

class RollDiceApp extends StatelessWidget {
  const RollDiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Roll Dice",
      home: const HomePage(),
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.turkeyRed,
        ),
      ),
    );
  }
}
