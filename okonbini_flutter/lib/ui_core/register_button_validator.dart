bool validateRegisterButton(
  String? userId,
  DateTime? dateOfBirth,
  String? email,
  String? password,
  String? passwordConfirm,
  String? userIdError,
  String? dateOfBirthError,
  String? emailError,
  String? passwordError,
  String? passwordConfirmError,
) {
  final isUserIdEmpty = userId == null || userId.isEmpty;
  final isDateOfBirthEmpty = dateOfBirth == null;
  final isEmailEmpty = email == null || email.isEmpty;
  final isPasswordEmpty = password == null || password.isEmpty;
  final isPasswordConfirmEmpty =
      passwordConfirm == null || passwordConfirm.isEmpty;

  final isUserIdError = userIdError != null;
  final isDateOfBirthError = dateOfBirthError != null;
  final isEmailError = emailError != null;
  final isPasswordError = passwordError != null;
  final isPasswordConfirmError = passwordConfirmError != null;

  return !isUserIdEmpty &&
      !isDateOfBirthEmpty &&
      !isEmailEmpty &&
      !isPasswordEmpty &&
      !isPasswordConfirmEmpty &&
      !isUserIdError &&
      !isDateOfBirthError &&
      !isEmailError &&
      !isPasswordError &&
      !isPasswordConfirmError;
}
