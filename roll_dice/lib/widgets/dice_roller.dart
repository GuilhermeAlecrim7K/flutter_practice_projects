import 'dart:math';

import 'package:flutter/material.dart';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  int _currentRoll = 1;
  final Random _randomizer = Random();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/dice-$_currentRoll.png',
          width: 300,
        ),
        const SizedBox(
          height: 30,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(20),
          ),
          onPressed: rollDice,
          child: const Icon(Icons.refresh),
        )
      ],
    );
  }

  void rollDice() {
    setState(() {
      _currentRoll = _randomizer.nextInt(6) + 1;
    });
  }
}
