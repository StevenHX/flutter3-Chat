import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/login_provider.dart';
import '../widgets/index.dart';

/// 登录屏幕
class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(loginFormProvider);
    final formNotifier = ref.read(loginFormProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              // Header with logo and title
              const LoginHeader(),
              const SizedBox(height: 40),
              // Email input
              EmailInputField(
                value: formState.email,
                onChanged: (email) => formNotifier.updateEmail(email),
                errorText: null,
              ),
              const SizedBox(height: 20),
              // Password input
              PasswordInputField(
                value: formState.password,
                onChanged: (password) =>
                    formNotifier.updatePassword(password),
                isPasswordVisible: formState.isPasswordVisible,
                onVisibilityToggle: () =>
                    formNotifier.togglePasswordVisibility(),
                errorText: null,
              ),
              const SizedBox(height: 28),
              // Error message (if any)
              if (formState.error != null)
                Padding(
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
                            formState.error!,
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
                ),
              // Sign in button
              SignInButton(
                onPressed: () {
                  _handleSignIn(context, ref, formState);
                },
                isLoading: formState.isLoading,
                isEnabled: formState.email.isNotEmpty &&
                    formState.password.isNotEmpty &&
                    !formState.isLoading,
              ),
              const SizedBox(height: 28),
              // Divider with text
              Row(
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
              ),
              const SizedBox(height: 20),
              // Social login buttons
              SocialLoginButtons(
                onEmailPressed: () {
                  _handleSocialLogin(context, 'Email');
                },
                onFacebookPressed: () {
                  _handleSocialLogin(context, 'Facebook');
                },
                onLinkedInPressed: () {
                  _handleSocialLogin(context, 'LinkedIn');
                },
              ),
              const SizedBox(height: 32),
              // Auth links (Sign up & Forgot password)
              AuthLinks(
                onSignUpPressed: () {
                  _handleSignUp(context);
                },
                onForgotPasswordPressed: () {
                  _handleForgotPassword(context);
                },
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  /// 处理登录
  void _handleSignIn(
    BuildContext context,
    WidgetRef ref,
    LoginFormState formState,
  ) {
    final formNotifier = ref.read(loginFormProvider.notifier);
    
    // Validate email
    if (!_isValidEmail(formState.email)) {
      formNotifier.setError('Please enter a valid email address');
      return;
    }

    // Validate password
    if (formState.password.length < 6) {
      formNotifier.setError('Password must be at least 6 characters');
      return;
    }

    // Simulate login process
    formNotifier.setLoading(true);
    
    Future.delayed(const Duration(seconds: 2), () {
      // In real app, call API here
      formNotifier.setLoading(false);
      
      // Simulate successful login
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login successful!'),
          backgroundColor: Color(0xFF4CAF50),
        ),
      );
      
      // Reset form
      formNotifier.reset();
      
      // Navigate to home (implement with your router)
      // ref.read(appRouterProvider).go('/home');
    });
  }

  /// 处理社交登录
  void _handleSocialLogin(BuildContext context, String provider) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Logging in with $provider...'),
        backgroundColor: const Color(0xFFFF6B35),
      ),
    );
  }

  /// 处理注册
  void _handleSignUp(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Navigate to Sign Up screen'),
        backgroundColor: Color(0xFF2196F3),
      ),
    );
  }

  /// 处理忘记密码
  void _handleForgotPassword(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Navigate to Forgot Password screen'),
        backgroundColor: Color(0xFFFF6B35),
      ),
    );
  }

  /// 验证邮箱格式
  bool _isValidEmail(String email) {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(email);
  }
}
