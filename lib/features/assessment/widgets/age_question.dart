import 'package:flutter/material.dart';
import 'question_title.dart';
import 'value_display.dart';
import 'value_slider.dart';
import 'continue_button.dart';

class AgeQuestion extends StatelessWidget {
  final double currentValue;
  final ValueChanged<double> onValueChanged;
  final VoidCallback? onContinue;

  const AgeQuestion({
    super.key,
    required this.currentValue,
    required this.onValueChanged,
    this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        const QuestionTitle(text: 'How old are you?'),
        const SizedBox(height: 48),
        ValueDisplay(
          value: currentValue,
          unit: 'years',
        ),
        const SizedBox(height: 24),
        ValueSlider(
          initialValue: currentValue,
          minValue: 10,
          maxValue: 100,
          onChanged: onValueChanged,
        ),
        const Spacer(),
        ContinueButton(onTap: onContinue),
        const SizedBox(height: 32),
      ],
    );
  }
}
