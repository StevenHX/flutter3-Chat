import 'package:flutter/material.dart';
import 'question_title.dart';
import 'unit_toggle.dart';
import 'value_display.dart';
import 'value_slider.dart';
import 'continue_button.dart';

class WeightQuestion extends StatelessWidget {
  final bool isKg;
  final double currentValue;
  final VoidCallback onUnitToggle;
  final ValueChanged<double> onValueChanged;
  final VoidCallback? onContinue;

  const WeightQuestion({
    super.key,
    required this.isKg,
    required this.currentValue,
    required this.onUnitToggle,
    required this.onValueChanged,
    this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        const QuestionTitle(text: 'What is your weight?'),
        const SizedBox(height: 48),
        UnitToggle(
          isMetric: isKg,
          metricLabel: 'kg',
          imperialLabel: 'lbs',
          onToggle: onUnitToggle,
        ),
        const SizedBox(height: 48),
        ValueDisplay(
          value: currentValue,
          unit: isKg ? 'kg' : 'lbs',
        ),
        const SizedBox(height: 24),
        ValueSlider(
          initialValue: currentValue,
          minValue: 40,
          maxValue: 150,
          onChanged: onValueChanged,
        ),
        const Spacer(),
        ContinueButton(onTap: onContinue),
        const SizedBox(height: 32),
      ],
    );
  }
}
