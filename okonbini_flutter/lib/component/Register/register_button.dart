import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:okonbini_flutter/constant/strings.dart';
import 'package:okonbini_flutter/provider/firebase_auth_provider.dart';
import 'package:okonbini_flutter/provider/register_provider.dart';
import 'package:okonbini_flutter/view/Home/home.dart';
import 'package:okonbini_flutter/view/Login/login.dart';

class UserRegisterButton extends ConsumerWidget {
  const UserRegisterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userName = ref.watch(registerUserIdProvider);
    final dateOfBirth = ref.watch(registerDateOfBirthProvider);
    final email = ref.watch(registerEmailProvider);
    final password = ref.watch(registerPasswordProvider);
    final registerButtonEnabled = ref.watch(registerButtonEnabledProvider);

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
        ),
        onPressed: registerButtonEnabled
            ? () async {
                bool isRegistrationComplete = await ref
                    .read(firebaseAuthProvider.notifier)
                    .register(userName, dateOfBirth!, email, password, ref);

                if (isRegistrationComplete) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const HomePage()));
                } else {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LoginPage()));
                }
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
