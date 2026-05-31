import 'package:flutter/material.dart';

class ContinueButton extends StatelessWidget {
  final VoidCallback? onTap;

  const ContinueButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(
          color: const Color(0xFF111214),
          borderRadius: BorderRadius.circular(19),
        ),
        child: TextButton.icon(
          onPressed: onTap,
          icon: const Text(
            'Continue',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          label: const Icon(
            Icons.arrow_right_alt,
            color: Colors.white,
            size: 24,
          ),
        ),
      ),
    );
  }
}
