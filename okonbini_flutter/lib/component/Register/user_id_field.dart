import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:okonbini_flutter/provider/register_provider.dart';
import 'package:okonbini_flutter/constant/strings.dart';

class UserIdField extends ConsumerWidget {
  UserIdField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(userIdProvider);
    final error = ref.watch(userIdErrorProvider);

    return TextFormField(
      initialValue: userId,
      decoration: InputDecoration(
        labelText: Strings.register.userIdLabel,
        labelStyle: const TextStyle(
          color: Colors.blue,
        ),
        hintText: Strings.register.userIdHint,
        hintStyle: const TextStyle(
          color: Colors.blue,
        ),
        errorText: error,
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
      onChanged: (value) {
        ref.read(userIdProvider.notifier).state = value;
        validateUserIdInput(ref);
      },
    );
  }
}
