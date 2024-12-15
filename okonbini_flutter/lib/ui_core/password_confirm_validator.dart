import 'package:okonbini_flutter/constant/strings.dart';

/// パスワード入力確認
String? validatePasswordConfirm(String? password, String? passwordConfirm) {
  if (passwordConfirm == null || passwordConfirm.isEmpty) {
    return Strings.register.passwordConfirmInputIsEmpty;
  }

  if (password != passwordConfirm) {
    return Strings.register.passwordConfirmInputIsInvalid;
  }

  return null;
}
