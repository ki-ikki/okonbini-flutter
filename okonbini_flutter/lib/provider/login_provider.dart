import 'package:flutter_riverpod/flutter_riverpod.dart';

// メールアドレスフォームの状態管理
final loginEmailProvider = StateProvider<String>((ref) => '');

// パスワードフォームの状態管理
final loginPasswordProvider = StateProvider<String>((ref) => '');

// ログインボタンの状態管理
final loginButtonProvider = StateProvider<String>((ref) => '');
