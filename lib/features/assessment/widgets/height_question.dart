import 'package:flutter/material.dart';
import 'question_title.dart';
import 'unit_toggle.dart';
import 'value_display.dart';
import 'value_slider.dart';
import 'continue_button.dart';

class HeightQuestion extends StatelessWidget {
  final bool isKg;
  final double currentValue;
  final VoidCallback onUnitToggle;
  final ValueChanged<double> onValueChanged;
  final VoidCallback? onContinue;

  const HeightQuestion({
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
        const QuestionTitle(text: 'What is your height?'),
        const SizedBox(height: 48),
        UnitToggle(
          isMetric: isKg,
          metricLabel: 'cm',
          imperialLabel: 'ft/in',
          onToggle: onUnitToggle,
        ),
        const SizedBox(height: 48),
        ValueDisplay(
          value: currentValue,
          unit: isKg ? 'cm' : 'ft',
        ),
        const SizedBox(height: 24),
        ValueSlider(
          initialValue: currentValue,
          minValue: 120,
          maxValue: 220,
          onChanged: onValueChanged,
        ),
        const Spacer(),
        ContinueButton(onTap: onContinue),
        const SizedBox(height: 32),
      ],
    );
  }
}
