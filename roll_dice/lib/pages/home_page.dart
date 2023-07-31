import 'package:flutter/material.dart';
import 'package:roll_dice/shared/app_colors.dart';
import 'package:roll_dice/widgets/dice_roller.dart';
import 'package:roll_dice/widgets/gradient_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Roll dice',
          style: TextStyle(fontSize: 26),
        ),
        backgroundColor: AppColors.turkeyRed,
      ),
      body: const GradientContainer(
        colors: AppColors.backgroundGradient,
        child: Center(
          child: DiceRoller(),
        ),
      ),
    );
  }
}
