import 'package:flutter/material.dart';

/// 现代柔美风格的输入框，适合搜索、表单和轻量交互场景。
class SoftInputField extends StatelessWidget {
  const SoftInputField({
    super.key,
    this.controller,
    this.focusNode,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.errorText,
    this.fillColor,
    this.hintStyle,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final ValueChanged<String>? onChanged;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? errorText;
  final Color? fillColor;
  final TextStyle? hintStyle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final surfaceColor = fillColor ?? colorScheme.surfaceVariant.withOpacity(0.16);

    return TextField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: onChanged,
      style: theme.textTheme.bodyLarge?.copyWith(
        color: colorScheme.onSurface,
        height: 1.25,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: surfaceColor,
        hintText: hintText,
        hintStyle: hintStyle ?? theme.textTheme.bodyMedium?.copyWith(
          color: colorScheme.onSurfaceVariant,
          height: 1.25,
        ),
        errorText: errorText,
        contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
        prefixIcon: prefixIcon == null
            ? null
            : Padding(
                padding: const EdgeInsets.only(left: 4, right: 8),
                child: IconTheme(
                  data: IconThemeData(color: colorScheme.primary, size: 22),
                  child: prefixIcon!,
                ),
              ),
        prefixIconConstraints: const BoxConstraints(minWidth: 48, minHeight: 48),
        suffixIcon: suffixIcon == null
            ? null
            : Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: IconTheme(
                  data: IconThemeData(color: colorScheme.primary, size: 22),
                  child: suffixIcon!,
                ),
              ),
        suffixIconConstraints: const BoxConstraints(minWidth: 48, minHeight: 48),
        border: _border(colorScheme.onSurfaceVariant.withOpacity(0.14)),
        enabledBorder: _border(colorScheme.onSurfaceVariant.withOpacity(0.14)),
        focusedBorder: _border(colorScheme.primary.withOpacity(0.9), width: 1.5),
        errorBorder: _border(theme.colorScheme.error.withOpacity(0.8)),
        focusedErrorBorder: _border(theme.colorScheme.error, width: 1.5),
      ),
    );
  }

  InputBorder _border(Color borderColor, {double width = 0}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(24),
      borderSide: BorderSide(color: borderColor, width: width),
    );
  }
}
