import 'package:flutter/material.dart';

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
        backgroundColor: const Color(0xFF250001),
      ),
      body: const Placeholder(),
    );
  }
}
