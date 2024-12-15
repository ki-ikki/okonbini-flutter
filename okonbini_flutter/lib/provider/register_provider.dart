import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:okonbini_flutter/ui_core/user_id_validator.dart';
import 'package:okonbini_flutter/ui_core/email_validator.dart';
import 'package:okonbini_flutter/ui_core/password_validator.dart';
import 'package:okonbini_flutter/ui_core/password_confirm_validator.dart';
import 'package:okonbini_flutter/ui_core/register_button_validator.dart';

// ユーザーIDフォームの状態管理
final userIdProvider = StateProvider<String>((ref) => '');
final userIdErrorProvider = StateProvider<String?>((ref) => null);

void validateUserIdInput(WidgetRef ref) {
  final userId = ref.read(userIdProvider);
  final error = validateUserId(userId);
  ref.read(userIdErrorProvider.notifier).state = error;
  enableRegisterButton(ref);
}

// メールアドレスフォームの状態管理
final emailProvider = StateProvider<String>((ref) => '');
final emailErrorProvider = StateProvider<String?>((ref) => null);

void validateEmailInput(WidgetRef ref) {
  final email = ref.read(emailProvider);
  final error = validateEmail(email);
  ref.read(emailErrorProvider.notifier).state = error;
  enableRegisterButton(ref);
}

// パスワードフォームの状態管理
final passwordProvider = StateProvider<String>((ref) => '');
final passwordErrorProvider = StateProvider<String?>((ref) => null);

void validatePasswordInput(WidgetRef ref) {
  final password = ref.read(passwordProvider);
  final error = validatePassword(password);
  ref.read(passwordErrorProvider.notifier).state = error;
  enableRegisterButton(ref);
}

// パスワード確認フォームの状態管理
final passwordConfirmProvider = StateProvider<String>((ref) => '');
final passwordConfirmErrorProvider = StateProvider<String?>((ref) => null);

void validatePasswordConfirmInput(WidgetRef ref) {
  final password = ref.read(passwordProvider);
  final passwordConfirm = ref.read(passwordConfirmProvider);
  final error = validatePasswordConfirm(password, passwordConfirm);
  ref.read(passwordConfirmErrorProvider.notifier).state = error;
  enableRegisterButton(ref);
}

// 登録ボタンの状態管理
final registerButtonEnabledProvider = StateProvider<bool>((ref) => false);

void enableRegisterButton(WidgetRef ref) {
  final userId = ref.read(userIdProvider);
  final email = ref.read(emailProvider);
  final password = ref.read(passwordProvider);

  final passwordConfirm = ref.read(passwordConfirmProvider);
  final userIdError = ref.read(userIdErrorProvider);
  final emailError = ref.read(emailErrorProvider);
  final passwordError = ref.read(passwordErrorProvider);
  final passwordConfirmError = ref.read(passwordConfirmErrorProvider);

  final isButtonEnabled = validateRegisterButton(
    userId,
    email,
    password,
    passwordConfirm,
    userIdError,
    emailError,
    passwordError,
    passwordConfirmError,
  );

  ref.read(registerButtonEnabledProvider.notifier).state = isButtonEnabled;
}
