import 'package:okonbini_flutter/constant/strings.dart';
import 'package:email_validator/email_validator.dart';

/// 英数字および記号（例: `_`, `-`, `@`, `.`）を許可
String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return Strings.register.emailInputIsEmpty;
  }

  if (!EmailValidator.validate(value)) {
    return Strings.register.emailInputIsInvalid;
  }

  return null;
}
