import 'package:flutter/material.dart';

/// 错误提示组件
class ErrorMessage extends StatelessWidget {
  final String message;

  const ErrorMessage({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFFFEBEE),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color(0xFFE74C3C),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.error_outline,
              color: Color(0xFFE74C3C),
              size: 16,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFE74C3C),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
