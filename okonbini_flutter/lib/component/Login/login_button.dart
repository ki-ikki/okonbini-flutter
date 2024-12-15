import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../constant/strings.dart';
import 'package:okonbini_flutter/provider/firebase_auth_provider.dart';
import 'package:okonbini_flutter/provider/login_provider.dart';
import 'package:okonbini_flutter/view/Home/home.dart';

class LoginButton extends ConsumerWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = ref.watch(emailProvider);
    final password = ref.watch(passwordProvider);

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
        ),
        child: Text(
          Strings.login.loginButton,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: () async {
          await ref.read(firebaseAuthProvider.notifier).login(email, password);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return const HomePage();
              },
            ),
          );
        },
      ),
    );
  }
}
