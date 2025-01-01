import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:okonbini_flutter/constant/strings.dart';
import 'package:okonbini_flutter/constant/urls.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Firebase 情報の状態管理
final uidProvider = StateProvider<String>((ref) => '');
final emailProvider = StateProvider<String>((ref) => '');
final idTokenProvider = StateProvider<String>((ref) => '');

// Riverpodプロバイダー
final firebaseAuthProvider =
    StateNotifierProvider<FirebaseAuthNotifier, String>((ref) {
  return FirebaseAuthNotifier();
});

// AuthNotifierクラス: 認証操作を管理
class FirebaseAuthNotifier extends StateNotifier<String> {
  FirebaseAuthNotifier() : super('');

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Firebase Auth でユーザー登録し、 provider にユーザー情報を更新する
  Future<bool> register(String userName, DateTime dateOfBirth, String email,
      String password, WidgetRef ref) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      // ユーザー情報の provider を更新し、 ユーザー情報を登録
      await updateLoggedInUserProvider(ref);
      try {
        final response = await http.post(
          Uri.parse(API_BASE_URL + 'users/register'),
          headers: {
            'Authorization':
                'Bearer ${ref.read(idTokenProvider.notifier).state}',
            'Content-Type': 'application/json',
          },
          body: json.encode({
            'user_name': userName,
            'date_of_birth': dateOfBirth.toString(),
            'email': email,
            'password': password,
            'unique_id': ref.read(uidProvider.notifier).state,
          }),
        );

        debugPrint('Response status: ${response.statusCode}');
        debugPrint('Response body: ${response.body}');
      } catch (e) {
        debugPrint('User registration API execution error: $e');
      }
    } catch (e) {
      debugPrint('User registration to firebase failed. : $e');
      return false;
    }

    return true;
  }

  // Firebase Auth でログインし、 provider にユーザー情報を更新する
  Future<void> login(String email, String password, WidgetRef ref) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      await updateLoggedInUserProvider(ref);
      state = Strings.login.loginSuccess;
      print(state); //TODO remove
    } catch (e) {
      state = Strings.login.loginFailure;
      print(state); //TODO remove
    }
  }

  // Firebase Auth でログアウト
  Future<void> logout() async {
    try {
      await _auth.signOut();
      state = Strings.login.logoutSuccess;
      print(Strings.login.logoutSuccess); //TODO remove
      print(state); //TODO remove
    } catch (e) {
      state = Strings.login.logoutFailure;
      print(state); //TODO remove
    }
  }

  // Firebase Auth でエラーメッセージハンドリング
  String _getAuthErrorMessage(String error) {
    switch (error) {
      case '[firebase_auth/email-already-in-use] The email address is already in use by another account.':
        return Strings.login.emailAlreadyInUse;
      case '[firebase_auth/invalid-email] The email address is badly formatted.':
        return Strings.login.invalidEmail;
      case '[firebase_auth/wrong-password] The password is invalid or the user does not have a password.':
        return Strings.login.wrongPassword;
      default:
        return Strings.login.unknownError;
    }
  }
}

// Firebase Auth でログイン中のユーザー情報を取得し、 provider を更新
Future<void> updateLoggedInUserProvider(WidgetRef ref) async {
  try {
    final User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      ref.read(emailProvider.notifier).state = currentUser.email ?? '';
      ref.read(uidProvider.notifier).state = currentUser.uid;

      // Firebase Auth から idToken を取得し、 provider を更新
      String? token = await currentUser.getIdToken(true);
      ref.read(idTokenProvider.notifier).state = token ?? '';
      debugPrint('Token updated: ${currentUser.email}');
    } else {
      debugPrint('No user is currently logged in.');
    }
  } catch (e) {
    debugPrint('Error retrieving current user: $e');
  }
}

// Firebase Auth トークンのリフレッシュする
Future<void> setupTokenRefresh(WidgetRef ref) async {
  FirebaseAuth.instance.idTokenChanges().listen((User? currentUser) async {
    if (currentUser != null) {
      try {
        String? token = await currentUser.getIdToken(true);
        ref.read(idTokenProvider.notifier).state = token ?? '';
        debugPrint('Token refreshed: $token');
      } catch (e) {
        debugPrint('Error refreshing token: $e');
      }
    }
  });
}
