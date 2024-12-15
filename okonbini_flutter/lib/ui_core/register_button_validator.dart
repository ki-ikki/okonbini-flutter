bool validateRegisterButton(
  String? userId,
  String? email,
  String? password,
  String? passwordConfirm,
  String? userIdError,
  String? emailError,
  String? passwordError,
  String? passwordConfirmError,
) {
  final isUserIdEmpty = userId == null || userId.isEmpty;
  final isEmailEmpty = email == null || email.isEmpty;
  final isPasswordEmpty = password == null || password.isEmpty;
  final isPasswordConfirmEmpty =
      passwordConfirm == null || passwordConfirm.isEmpty;

  final isUserIdError = userIdError != null;
  final isEmailError = emailError != null;
  final isPasswordError = passwordError != null;
  final isPasswordConfirmError = passwordConfirmError != null;

  return !isUserIdEmpty &&
      !isEmailEmpty &&
      !isPasswordEmpty &&
      !isPasswordConfirmEmpty &&
      !isUserIdError &&
      !isEmailError &&
      !isPasswordError &&
      !isPasswordConfirmError;
}
