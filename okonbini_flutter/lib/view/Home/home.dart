import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:okonbini_flutter/view/Login/login.dart';
import 'package:okonbini_flutter/provider/firebase_auth_provider.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    String email = ref.read(emailProvider);
    String uid = ref.read(uidProvider);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('ユーザーID: $uid'),
            Text('メールアドレス: $email'),
            ElevatedButton(
              child: const Text('ログアウト'),
              onPressed: () async {
                await ref.read(firebaseAuthProvider.notifier).logout();
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return const LoginPage();
                  }),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
