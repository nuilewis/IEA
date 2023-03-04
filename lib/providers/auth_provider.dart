import 'package:flutter/material.dart';

import '../repositories/auth_repository.dart';

enum AuthSate { initial, submitting, success, error }
enum UserLoginSta {authenticated, unauthenticated}

class AuthProvider extends ChangeNotifier {
  AuthRepository authRepository;

  String errorMessage = "";

  AuthSate state = AuthSate.initial;

  AuthProvider({required this.authRepository});

  Future<void> signIn() async {}
  Future<void> register() async {}
  Future<void> updateAccountInfo() async {}
  Future<void> deleteAccount() async {}
}
