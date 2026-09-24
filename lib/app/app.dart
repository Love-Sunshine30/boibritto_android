import 'package:flutter/material.dart';
import 'theme/theme.dart';

class BoibrittoApp extends StatelessWidget {
  const BoibrittoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Boibritto',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const Scaffold(
        body: Center(
          child: Text(
            'বই বৃত্ত',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}