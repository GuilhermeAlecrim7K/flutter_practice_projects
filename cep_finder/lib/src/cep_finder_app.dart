import 'package:cep_finder/src/pages/home_page.dart';
import 'package:flutter/material.dart';

class CepFinderApp extends StatelessWidget {
  const CepFinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CEP Finder',
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: const HomePage(),
    );
  }
}
