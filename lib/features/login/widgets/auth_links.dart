import 'package:flutter/material.dart';

/// 认证相关链接组件（注册和忘记密码）
class AuthLinks extends StatelessWidget {
  final VoidCallback onSignUpPressed;
  final VoidCallback onForgotPasswordPressed;

  const AuthLinks({
    super.key,
    required this.onSignUpPressed,
    required this.onForgotPasswordPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Sign up link
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Don't have an account? ",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Color(0xFF666666),
              ),
            ),
            GestureDetector(
              onTap: onSignUpPressed,
              child: const Text(
                'Sign up',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFFF6B35),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        // Forgot password link
        GestureDetector(
          onTap: onForgotPasswordPressed,
          child: const Text(
            'Forgot Password?',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xFFFF6B35),
            ),
          ),
        ),
      ],
    );
  }
}
