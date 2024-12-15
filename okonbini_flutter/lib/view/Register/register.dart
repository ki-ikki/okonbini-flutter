import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:okonbini_flutter/component/Register/password_confirm_field.dart';
import 'package:okonbini_flutter/component/Register/user_id_field.dart';
import 'package:okonbini_flutter/component/Register/email_field.dart';
import 'package:okonbini_flutter/component/Register/password_field.dart';
import 'package:okonbini_flutter/component/Register/register_button.dart';

class Register extends ConsumerStatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends ConsumerState<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
            padding: const EdgeInsets.all(24),
            margin: const EdgeInsets.all(24),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // ロゴ表示
                  Container(
                    margin: const EdgeInsets.only(bottom: 24),
                    child: Image.asset('assets/logo.png'),
                  ),

                  // ユーザーID入力
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: UserIdField(),
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

                  // パスワード確認入力
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: const PasswordConfirmField(),
                  ),

                  // 登録ボタン
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: const UserRegisterButton(),
                  ),
                ])),
      ),
    );
  }
}
