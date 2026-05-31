import 'package:flutter/material.dart';

class UnitToggle extends StatelessWidget {
  final bool isMetric;
  final String metricLabel;
  final String imperialLabel;
  final VoidCallback onToggle;

  const UnitToggle({
    super.key,
    required this.isMetric,
    required this.metricLabel,
    required this.imperialLabel,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F3F4),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Expanded(
            child: _UnitButton(
              label: metricLabel,
              isSelected: isMetric,
              onTap: isMetric ? null : () => onToggle(),
            ),
          ),
          Expanded(
            child: _UnitButton(
              label: imperialLabel,
              isSelected: !isMetric,
              onTap: !isMetric ? null : () => onToggle(),
            ),
          ),
        ],
      ),
    );
  }
}

class _UnitButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback? onTap;

  const _UnitButton({
    required this.label,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF2563EB) : Colors.transparent,
          borderRadius: BorderRadius.circular(14),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: const Color(0xFF2563EB).withValues(alpha: 0.25),
                    blurRadius: 0,
                    spreadRadius: 4,
                    offset: const Offset(0, 0),
                  ),
                ]
              : null,
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : const Color(0xFF676C75),
            ),
          ),
        ),
      ),
    );
  }
}
