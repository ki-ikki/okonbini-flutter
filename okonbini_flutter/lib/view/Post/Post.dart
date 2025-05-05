import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:okonbini_flutter/provider/firebase_auth_provider.dart';
import 'package:okonbini_flutter/view/Login/login.dart';

class PostPage extends ConsumerStatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends ConsumerState<PostPage> {
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
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) {
                    return const LoginPage();
                  }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
