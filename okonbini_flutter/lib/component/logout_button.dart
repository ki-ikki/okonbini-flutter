import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../constant/strings.dart';
import 'package:okonbini_flutter/provider/firebase_auth_provider.dart';

class LogoutButton extends ConsumerWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        child: Text(Strings.login.logoutButton),
        onPressed: () {
          ref.read(firebaseAuthProvider.notifier).logout();
        },
      ),
    );
  }
}
