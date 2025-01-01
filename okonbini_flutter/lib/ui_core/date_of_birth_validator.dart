import 'package:okonbini_flutter/constant/strings.dart';

String? validateDateOfBirth(DateTime? value) {
  if (value == null) {
    return Strings.register.dateOfBirthInputIsEmpty;
  }

  final now = DateTime.now();
  if (value.isAfter(now)) {
    return Strings.register.dateOfBirthErrorFutureDate;
  }

  return null;
}
