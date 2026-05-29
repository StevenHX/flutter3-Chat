/// 表单验证工具类
class FormValidators {
  /// 验证邮箱格式
  static bool isValidEmail(String email) {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(email);
  }

  /// 验证密码长度
  static bool isValidPasswordLength(String password, {int minLength = 6}) {
    return password.trim().length >= minLength;
  }
}
