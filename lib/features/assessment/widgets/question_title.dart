import 'package:flutter/material.dart';

class QuestionTitle extends StatelessWidget {
  final String text;

  const QuestionTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Color(0xFF111214),
          height: 38 / 30,
        ),
      ),
    );
  }
}
