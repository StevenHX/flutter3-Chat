import 'package:flutter/material.dart';

/// 分割线组件（带有 "or continue with" 文字）
class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            color: const Color(0xFFE5E5E5),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'or continue with',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF999999),
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 1,
            color: const Color(0xFFE5E5E5),
          ),
        ),
      ],
    );
  }
}
