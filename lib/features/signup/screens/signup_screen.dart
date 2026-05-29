import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/widgets/index.dart';
import '../../../shared/utils/index.dart';
import '../providers/signup_provider.dart';
import '../widgets/index.dart';
import '../../login/widgets/index.dart';

/// 注册屏幕
class SignupScreen extends ConsumerWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(signupFormProvider);
    final formNotifier = ref.read(signupFormProvider.notifier);

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
              const LoginHeader(
                title: 'Create Account',
                subtitle: 'Please fill in the form to continue',
              ),
              const SizedBox(height: 40),
              // Name input
              NameInputField(
                value: formState.name,
                onChanged: (name) => formNotifier.updateName(name),
                errorText: null,
              ),
              const SizedBox(height: 20),
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
                onChanged: (password) => formNotifier.updatePassword(password),
                isPasswordVisible: formState.isPasswordVisible,
                onVisibilityToggle: () => formNotifier.togglePasswordVisibility(),
                errorText: null,
              ),
              const SizedBox(height: 20),
              // Confirm Password input
              ConfirmPasswordInputField(
                value: formState.confirmPassword,
                onChanged: (confirmPassword) =>
                    formNotifier.updateConfirmPassword(confirmPassword),
                isPasswordVisible: formState.isConfirmPasswordVisible,
                onVisibilityToggle: () =>
                    formNotifier.toggleConfirmPasswordVisibility(),
                errorText: null,
              ),
              const SizedBox(height: 16),
              // Terms agreement
              TermsAgreementCheckbox(
                value: formState.agreeToTerms,
                onChanged: (agree) => formNotifier.toggleAgreeToTerms(),
                onTermsPressed: () {
                  _handleTermsPressed(context);
                },
                onPrivacyPressed: () {
                  _handlePrivacyPressed(context);
                },
              ),
              const SizedBox(height: 28),
              // Error message (if any)
              if (formState.error != null)
                ErrorMessage(message: formState.error!),
              // Sign Up button
              PrimaryButton(
                text: 'Sign Up',
                onPressed: () {
                  _handleSignUp(context, ref, formState);
                },
                isLoading: formState.isLoading,
                isEnabled: _isFormValid(formState),
              ),
              const SizedBox(height: 28),
              // Divider with text
              const OrDivider(),
              const SizedBox(height: 20),
              // Social login buttons
              SocialLoginButtons(
                onEmailPressed: () {
                  _handleSocialSignUp(context, 'Email');
                },
                onFacebookPressed: () {
                  _handleSocialSignUp(context, 'Facebook');
                },
                onLinkedInPressed: () {
                  _handleSocialSignUp(context, 'LinkedIn');
                },
              ),
              const SizedBox(height: 32),
              // Auth links (Sign in)
              _buildSignInLink(context),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  /// 检查表单是否有效
  bool _isFormValid(SignupFormState formState) {
    return formState.name.isNotEmpty &&
        formState.email.isNotEmpty &&
        formState.password.isNotEmpty &&
        formState.confirmPassword.isNotEmpty &&
        formState.agreeToTerms &&
        !formState.isLoading;
  }

  /// 处理注册
  void _handleSignUp(
    BuildContext context,
    WidgetRef ref,
    SignupFormState formState,
  ) {
    final formNotifier = ref.read(signupFormProvider.notifier);

    // Validate name
    if (formState.name.trim().isEmpty) {
      formNotifier.setError('Please enter your full name');
      return;
    }

    // Validate email
    if (!FormValidators.isValidEmail(formState.email)) {
      formNotifier.setError('Please enter a valid email address');
      return;
    }

    // Validate password
    if (!FormValidators.isValidPasswordLength(formState.password)) {
      formNotifier.setError('Password must be at least 6 characters');
      return;
    }

    // Validate confirm password
    if (formState.password != formState.confirmPassword) {
      formNotifier.setError('Passwords do not match');
      return;
    }

    // Simulate signup process
    formNotifier.setLoading(true);

    Future.delayed(const Duration(seconds: 2), () {
      // In real app, call API here
      formNotifier.setLoading(false);

      // Simulate successful signup
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Account created successfully!'),
          backgroundColor: Color(0xFF4CAF50),
        ),
      );

      // Reset form
      formNotifier.reset();

      // Navigate back to login
      if (Navigator.canPop(context)) {
        Navigator.pop(context);
      }
    });
  }

  /// 处理社交注册
  void _handleSocialSignUp(BuildContext context, String provider) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Signing up with $provider...'),
        backgroundColor: const Color(0xFFFF6B35),
      ),
    );
  }

  /// 处理条款点击
  void _handleTermsPressed(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Open Terms of Service'),
        backgroundColor: Color(0xFF2196F3),
      ),
    );
  }

  /// 处理隐私政策点击
  void _handlePrivacyPressed(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Open Privacy Policy'),
        backgroundColor: Color(0xFF2196F3),
      ),
    );
  }

  /// 构建返回登录链接
  Widget _buildSignInLink(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Already have an account? ',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xFF666666),
            ),
          ),
          GestureDetector(
            onTap: () {
              _handleSignInPressed(context);
            },
            child: const Text(
              'Sign In',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFFFF6B35),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 处理登录点击
  void _handleSignInPressed(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

}
