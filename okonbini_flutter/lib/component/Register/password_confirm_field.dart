import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:okonbini_flutter/provider/register_provider.dart';
import 'package:okonbini_flutter/constant/strings.dart';

class PasswordConfirmField extends ConsumerWidget {
  const PasswordConfirmField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passwordConfirmError = ref.watch(passwordConfirmErrorProvider);

    return TextFormField(
      decoration: InputDecoration(
        labelText: Strings.register.passwordConfirmLabel,
        labelStyle: const TextStyle(
          color: Colors.blue,
        ),
        errorText: passwordConfirmError,
        errorStyle: const TextStyle(
          color: Colors.red,
          fontSize: 10,
        ),
        contentPadding: const EdgeInsets.only(left: 20),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue, width: 1.0),
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue, width: 2.0),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      obscureText: true,
      onChanged: (value) {
        ref.read(passwordConfirmProvider.notifier).state = value;
        validatePasswordConfirmInput(ref);
      },
    );
  }
}
