import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../constant/strings.dart';
import 'package:okonbini_flutter/provider/firebase_auth_provider.dart';
import 'package:okonbini_flutter/provider/register_provider.dart';
import 'package:okonbini_flutter/view/Home/home.dart';

class UserRegisterButton extends ConsumerWidget {
  const UserRegisterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = ref.watch(emailProvider);
    final password = ref.watch(passwordProvider);
    final registerButtonEnabled = ref.watch(registerButtonEnabledProvider);

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
        ),
        onPressed: registerButtonEnabled
            ? () async {
                await ref
                    .read(firebaseAuthProvider.notifier)
                    .register(email, password);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const HomePage();
                    },
                  ),
                );
              }
            : null,
        child: Text(Strings.register.registerButton,
            style: const TextStyle(
              color: Colors.white,
            )),
      ),
    );
  }
}
