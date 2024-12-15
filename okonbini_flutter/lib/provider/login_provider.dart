import 'package:flutter_riverpod/flutter_riverpod.dart';

// メールアドレスフォームの状態管理
final emailProvider = StateProvider<String>((ref) => '');

// パスワードフォームの状態管理
final passwordProvider = StateProvider<String>((ref) => '');

// ログインボタンの状態管理
final loginButtonProvider = StateProvider<String>((ref) => '');
