import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:okonbini_flutter/constant/strings.dart';

// TODO: ConsumerWidgetに変更。Providerを使ってエラーメッセージを表示するように変更
class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  // メッセージ表示用
  String infoText = '';
  String mailAddress = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // メールアドレス入力
              TextFormField(
                decoration:
                    InputDecoration(labelText: Strings.login.emailLabel),
                onChanged: (String value) {
                  mailAddress = value;
                },
              ),

              Container(
                padding: const EdgeInsets.all(8),
                // メッセージ表示
                child: Text(infoText),
              ),

              SizedBox(
                width: double.infinity,
                // パスワードリセットボタン
                child: ElevatedButton(
                  child: Text(Strings.login.passwordResetButton),
                  onPressed: () async {
                    try {
                      final FirebaseAuth auth = FirebaseAuth.instance;
                      await auth.sendPasswordResetEmail(email: mailAddress);
                      setState(() {
                        infoText = Strings.login.passwordResetMailSent;
                      });
                    } catch (e) {
                      setState(() {
                        infoText =
                            '${Strings.login.passwordResetMailFailed} ${e.toString()}';
                      });
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
