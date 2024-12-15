import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../provider/register_provider.dart';
import '../../constant/strings.dart';

class EmailField extends ConsumerWidget {
  const EmailField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = ref.watch(emailProvider);
    final error = ref.watch(emailErrorProvider);

    return Form(
        autovalidateMode: AutovalidateMode.always,
        child: TextFormField(
            initialValue: email,
            decoration: InputDecoration(
              labelText: Strings.register.emailLabel,
              labelStyle: const TextStyle(
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
              ref.read(emailProvider.notifier).state = value;
              validateEmailInput(ref);
            }));
  }
}
