import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
      // Firebase Auth でユーザー登録
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      // Firebase Auth でログイン中のユーザー情報を取得
      final User? currentUser = FirebaseAuth.instance.currentUser;

      // ユーザー情報から provider を更新
      if (currentUser != null) {
        await updateLoggedInUserProvider(currentUser, ref);
      } else {
        debugPrint('No user is currently logged in.');
      }

      // ユーザー情報を DB に登録
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

        // ローカルにユーザー情報を保存
        if (response.statusCode == 200) {
          await saveUserInformationLocally(
              ref.read(uidProvider.notifier).state,
              ref.read(emailProvider.notifier).state,
              ref.read(idTokenProvider.notifier).state);
        } else {
          debugPrint('User registration API failed: ${response.statusCode}');
          return false;
        }
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
      state = Strings.login.loginSuccess;
    } catch (e) {
      state = Strings.login.loginFailure;
    }

    // Firebase Auth でログイン中のユーザー情報を取得する
    final User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      await updateLoggedInUserProvider(currentUser, ref);
    } else {
      debugPrint('No user is currently logged in.');
    }
  }

  // Firebase Auth でログアウト
  Future<void> logout() async {
    try {
      await _auth.signOut();
      state = Strings.login.logoutSuccess;
    } catch (e) {
      state = Strings.login.logoutFailure;
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
Future<void> updateLoggedInUserProvider(User currentUser, WidgetRef ref) async {
  try {
    // Firebase Auth から idToken を取得し、 provider を更新
    ref.read(idTokenProvider.notifier).state =
        await currentUser.getIdToken(true) ?? '';

    await saveUserInformationLocally(currentUser.uid, currentUser.email ?? '',
        await currentUser.getIdToken() ?? '');
  } catch (e) {
    debugPrint('Error retrieving current user: $e');
  }
}

// ローカルにユーザー情報を保存
Future<void> saveUserInformationLocally(
    String uid, String email, String idToken) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('uid', uid);
  prefs.setString('email', email);
  prefs.setString('idToken', idToken);
}

// ローカルからユーザー情報を取得
Future<Map<String, dynamic>> getUserInformationLocally() async {
  final prefs = await SharedPreferences.getInstance();
  return {
    'uid': prefs.getString('uid'),
    'email': prefs.getString('email'),
    'idToken': prefs.getString('idToken'),
  };
}
