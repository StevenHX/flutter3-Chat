import 'package:flutter/material.dart';

class ValueDisplay extends StatelessWidget {
  final double value;
  final String unit;

  const ValueDisplay({
    super.key,
    required this.value,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          value.round().toString(),
          style: const TextStyle(
            fontSize: 96,
            fontWeight: FontWeight.w800,
            color: Color(0xFF111214),
            height: 1,
          ),
        ),
        const SizedBox(width: 4),
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            unit,
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w500,
              color: Color(0xFF676C75),
              height: 44 / 36,
            ),
          ),
        ),
      ],
    );
  }
}
