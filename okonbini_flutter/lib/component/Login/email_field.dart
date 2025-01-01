import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../provider/login_provider.dart';
import '../../constant/strings.dart';

class EmailField extends ConsumerWidget {
  const EmailField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: Strings.login.emailLabel,
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
      onChanged: (value) => ref.read(loginEmailProvider.notifier).state = value,
    );
  }
}
