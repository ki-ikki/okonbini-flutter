import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/firebase_options.dart';
import 'view/Login/login.dart';
import 'view/Home/home.dart';
import 'provider/firebase_auth_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase の初期化
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Okonbini',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthState(),
    );
  }
}

class AuthState extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // 読み込み中にインジケーターを中央配置
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasData) {
          return const HomePage();
        } else {
          // ユーザーがログインしていない場合は Login を表示
          return const LoginPage();
        }
      },
    );
  }
}
