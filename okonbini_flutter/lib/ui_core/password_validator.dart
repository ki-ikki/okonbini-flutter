import 'package:okonbini_flutter/constant/strings.dart';

/// 8文字以上、大文字・小文字・数字をそれぞれ1文字以上を許可
String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return Strings.register.passwordInputIsEmpty;
  }

  final regex = RegExp(r'^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9]).{8,100}$');
  if (!regex.hasMatch(value)) {
    return Strings.register.passwordInputIsInvalid;
  }

  return null;
}
