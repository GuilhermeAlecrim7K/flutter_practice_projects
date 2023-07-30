import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  final String data;

  const StyledText(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: const TextStyle(
        fontSize: 28,
        color: Colors.white,
      ),
    );
  }
}
