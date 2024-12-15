import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:okonbini_flutter/constant/strings.dart';

// Riverpodプロバイダー
final firebaseAuthProvider =
    StateNotifierProvider<FirebaseAuthNotifier, String>((ref) {
  return FirebaseAuthNotifier();
});

// AuthNotifierクラス: 認証操作を管理
class FirebaseAuthNotifier extends StateNotifier<String> {
  FirebaseAuthNotifier() : super('');

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> register(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      state = Strings.login.registrationSuccess;
    } catch (e) {
      state = _getAuthErrorMessage(e.toString());
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      state = Strings.login.loginSuccess;
    } catch (e) {
      state = Strings.login.loginFailure;
    }
  }

  Future<void> logout() async {
    try {
      await _auth.signOut();
      state = Strings.login.logoutSuccess;
    } catch (e) {
      state = Strings.login.logoutFailure;
    }
  }

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
