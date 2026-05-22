import 'package:flutter/material.dart';

/// 社交登录按钮类型
enum SocialLoginType {
  email,
  facebook,
  linkedin,
}

/// 单个社交登录按钮
class SocialLoginButton extends StatelessWidget {
  final SocialLoginType type;
  final VoidCallback onPressed;

  const SocialLoginButton({
    super.key,
    required this.type,
    required this.onPressed,
  });

  IconData _getIcon() {
    switch (type) {
      case SocialLoginType.email:
        return Icons.mail_outline;
      case SocialLoginType.facebook:
        return Icons.facebook;
      case SocialLoginType.linkedin:
        return Icons.business;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: const Color(0xFFE5E5E5),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Icon(
            _getIcon(),
            color: const Color(0xFF666666),
            size: 24,
          ),
        ),
      ),
    );
  }
}

/// 社交登录按钮组合
class SocialLoginButtons extends StatelessWidget {
  final VoidCallback onEmailPressed;
  final VoidCallback onFacebookPressed;
  final VoidCallback onLinkedInPressed;

  const SocialLoginButtons({
    super.key,
    required this.onEmailPressed,
    required this.onFacebookPressed,
    required this.onLinkedInPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialLoginButton(
          type: SocialLoginType.email,
          onPressed: onEmailPressed,
        ),
        const SizedBox(width: 16),
        SocialLoginButton(
          type: SocialLoginType.facebook,
          onPressed: onFacebookPressed,
        ),
        const SizedBox(width: 16),
        SocialLoginButton(
          type: SocialLoginType.linkedin,
          onPressed: onLinkedInPressed,
        ),
      ],
    );
  }
}
