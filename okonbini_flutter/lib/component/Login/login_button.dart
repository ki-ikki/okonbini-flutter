import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:okonbini_flutter/view/Login/login.dart';
import 'package:okonbini_flutter/provider/login_provider.dart';
import 'package:okonbini_flutter/view/Home/home.dart';
import 'package:okonbini_flutter/constant/strings.dart';
import 'package:okonbini_flutter/provider/firebase_auth_provider.dart';

class LoginButton extends ConsumerWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = ref.watch(loginEmailProvider);
    final password = ref.watch(loginPasswordProvider);

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
          bool isLogin;
          try {
            await ref
                .read(firebaseAuthProvider.notifier)
                .login(email, password, ref);

            /*
            * ログイン成功時、 ログイン情報を provider に保存し HomePage へ遷移
            * ログイン情報を保存できなかった場合、ログイン画面を表示
            */
            try {
              await updateLoggedInUserProvider(ref);
              isLogin = true;
            } catch (e) {
              isLogin = false;
            }
          } catch (e) {
            debugPrint('Login failed : $e');
            isLogin = false;
          }
          if (context.mounted) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return isLogin ? const HomePage() : const LoginPage();
                },
              ),
            );
          }
        },
      ),
    );
  }
}
