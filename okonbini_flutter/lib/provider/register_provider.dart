import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:okonbini_flutter/ui_core/user_id_validator.dart';
import 'package:okonbini_flutter/ui_core/email_validator.dart';
import 'package:okonbini_flutter/ui_core/password_validator.dart';
import 'package:okonbini_flutter/ui_core/password_confirm_validator.dart';
import 'package:okonbini_flutter/ui_core/register_button_validator.dart';
import 'package:okonbini_flutter/ui_core/date_of_birth_validator.dart';

// ユーザーIDフォームの状態管理
final registerUserIdProvider = StateProvider<String>((ref) => '');
final registerUserIdErrorProvider = StateProvider<String?>((ref) => null);

void validateUserIdInput(WidgetRef ref) {
  final userId = ref.read(registerUserIdProvider);
  final error = validateUserId(userId);
  ref.read(registerUserIdErrorProvider.notifier).state = error;
  enableRegisterButton(ref);
}

// 誕生日フォームの状態管理
final registerDateOfBirthProvider = StateProvider<DateTime?>((ref) => null);
final registerDateOfBirthErrorProvider = StateProvider<String?>((ref) => null);

void validateUserDateOfBirthInput(WidgetRef ref) {
  final dateOfBirth = ref.read(registerDateOfBirthProvider);
  final error = validateDateOfBirth(dateOfBirth);
  ref.read(registerDateOfBirthErrorProvider.notifier).state = error;
  enableRegisterButton(ref);
}

// メールアドレスフォームの状態管理
final registerEmailProvider = StateProvider<String>((ref) => '');
final registerEmailErrorProvider = StateProvider<String?>((ref) => null);

void validateEmailInput(WidgetRef ref) {
  final email = ref.read(registerEmailProvider);
  final error = validateEmail(email);
  ref.read(registerEmailErrorProvider.notifier).state = error;
  enableRegisterButton(ref);
}

// パスワードフォームの状態管理
final registerPasswordProvider = StateProvider<String>((ref) => '');
final registerPasswordErrorProvider = StateProvider<String?>((ref) => null);

void validatePasswordInput(WidgetRef ref) {
  final password = ref.read(registerPasswordProvider);
  final error = validatePassword(password);
  ref.read(registerPasswordErrorProvider.notifier).state = error;
  enableRegisterButton(ref);
}

// パスワード確認フォームの状態管理
final registerPasswordConfirmProvider = StateProvider<String>((ref) => '');
final registerPasswordConfirmErrorProvider =
    StateProvider<String?>((ref) => null);

void validatePasswordConfirmInput(WidgetRef ref) {
  final password = ref.read(registerPasswordProvider);
  final passwordConfirm = ref.read(registerPasswordConfirmProvider);
  final error = validatePasswordConfirm(password, passwordConfirm);
  ref.read(registerPasswordConfirmErrorProvider.notifier).state = error;
  enableRegisterButton(ref);
}

// 登録ボタンの状態管理
final registerButtonEnabledProvider = StateProvider<bool>((ref) => false);

void enableRegisterButton(WidgetRef ref) {
  final userId = ref.read(registerUserIdProvider);
  final dateOfBirth = ref.read(registerDateOfBirthProvider);
  final email = ref.read(registerEmailProvider);
  final password = ref.read(registerPasswordProvider);

  final passwordConfirm = ref.read(registerPasswordConfirmProvider);
  final userIdError = ref.read(registerUserIdErrorProvider);
  final dateOfBirthError = ref.read(registerDateOfBirthErrorProvider);
  final emailError = ref.read(registerEmailErrorProvider);
  final passwordError = ref.read(registerPasswordErrorProvider);
  final passwordConfirmError = ref.read(registerPasswordConfirmErrorProvider);

  final isButtonEnabled = validateRegisterButton(
    userId,
    dateOfBirth,
    email,
    password,
    passwordConfirm,
    userIdError,
    dateOfBirthError,
    emailError,
    passwordError,
    passwordConfirmError,
  );

  ref.read(registerButtonEnabledProvider.notifier).state = isButtonEnabled;
}
