import 'package:okonbini_flutter/constant/strings.dart';

/// 英数字および記号（例: `_`, `-`, `@`, `.`）を許可
String? validateUserId(String? value) {
  if (value == null || value.isEmpty) {
    return Strings.register.emailInputIsEmpty;
  }

  final regex = RegExp(r'^[a-zA-Z0-9_\-@.]+$');
  if (!regex.hasMatch(value)) {
    return Strings.register.userIdInputIsInvalid;
  }

  return null;
}
