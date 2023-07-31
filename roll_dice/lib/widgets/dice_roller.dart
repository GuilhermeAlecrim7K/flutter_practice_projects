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
  final Map<int, Image> _diceRolls = {
    for (var i = 1; i <= 6; i++)
      i: Image.asset('assets/images/dice-$i.png', width: 300)
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _diceRolls[_currentRoll]!,
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
