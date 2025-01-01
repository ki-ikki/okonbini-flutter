import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:okonbini_flutter/provider/login_provider.dart';
import 'package:okonbini_flutter/constant/strings.dart';

class PasswordField extends ConsumerWidget {
  const PasswordField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: Strings.login.passwordLabel,
        labelStyle: const TextStyle(
          color: Colors.blue,
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
      onChanged: (value) =>
          ref.read(loginPasswordProvider.notifier).state = value,
    );
  }
}
