import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:okonbini_flutter/provider/firebase_auth_provider.dart';
import 'package:okonbini_flutter/view/Login/reset_password.dart';
import 'package:okonbini_flutter/view/Register/register.dart';
import 'package:okonbini_flutter/constant/strings.dart';
import 'package:okonbini_flutter/component/Login/email_field.dart';
import 'package:okonbini_flutter/component/Login/password_field.dart';
import 'package:okonbini_flutter/component/Login/login_button.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final infoText = ref.watch(firebaseAuthProvider);
    print(infoText); //TODO: remove

    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          margin: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(bottom: 24),
                child: Image.asset('assets/logo.png'),
              ),

              // メールアドレス入力
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: const EmailField(),
              ),

              // パスワード入力
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: const PasswordField(),
              ),

              // エラーメッセージ表示
              Container(
                  child: Text(
                infoText,
                style: const TextStyle(color: Colors.red),
              )),

              // ログインボタン
              const LoginButton(),

              // パスワードリセット画面へのリンク
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return const ResetPasswordScreen();
                    }),
                  );
                },
                child: Text(
                  Strings.login.forgotPassword,
                  style: TextStyle(color: Colors.red),
                ),
              ),

              // ユーザー登録画面へのリンク
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return const Register();
                    }),
                  );
                },
                child: Text(
                  Strings.login.registerButton,
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
