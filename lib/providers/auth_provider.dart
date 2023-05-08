import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:water_project/models/auth_models.dart';

import '../core/enums/app_state_enum.dart';
import '../core/enums/auth_state_enum.dart';
import '../core/errors/failure.dart';
import '../repositories/auth_repository.dart';

class AuthProvider extends ChangeNotifier {
  AuthRepository authRepository;
  String errorMessage = "";
  AppState appState = AppState.initial;
  AuthState authState = AuthState.unauthenticated;
  User? user;

  AuthProvider({required this.authRepository});

  Future<void> signInWithEmail(SignInParameters parameters) async {
    appState = AppState.submitting;
    notifyListeners();

    Either<Failure, User?> result =
        await authRepository.signInWithEmail(parameters: parameters);

    result.fold((failure) {
      errorMessage =
          failure.errorMessage ?? "An error occurred while trying to sign in";
      appState = AppState.error;
      authState = AuthState.unauthenticated;
      notifyListeners();
    }, (signedInUser) {
      appState = AppState.success;
      authState = AuthState.authenticated;
      user = signedInUser;
      notifyListeners();
    });
  }

  Future<void> registerWithEmail(RegisterParameters parameters) async {
    appState = AppState.submitting;
    notifyListeners();

    Either<Failure, User?> result =
        await authRepository.registerWithEmail(parameters: parameters);

    result.fold((failure) {
      errorMessage =
          failure.errorMessage ?? "An error occurred while trying to register";
      appState = AppState.error;
      authState = AuthState.unauthenticated;
      notifyListeners();
    }, (registeredUser) {
      appState = AppState.success;
      authState = AuthState.authenticated;
      user = registeredUser;
      notifyListeners();
    });
  }

  Future<void> signInWithGoogle() async {
    appState = AppState.submitting;
    notifyListeners();

    Either<Failure, User?> result = await authRepository.signInWithGoogle();

    result.fold((failure) {
      errorMessage = failure.errorMessage ??
          "An error occurred while trying to sign in with Google";
      appState = AppState.error;
      authState = AuthState.unauthenticated;
      notifyListeners();
    }, (signedInUser) {
      appState = AppState.success;
      authState = AuthState.authenticated;
      user = signedInUser;
      notifyListeners();
    });
  }

  Future<void> updateAccountInfo() async {
    appState = AppState.submitting;
    notifyListeners();

    Either<Failure, void> result = await authRepository.updateAccountInfo();

    result.fold((failure) {
      errorMessage = failure.errorMessage ??
          "An error occurred while trying to update your information";
      appState = AppState.error;
      authState = AuthState.unauthenticated;
      notifyListeners();
    }, (success) {
      appState = AppState.success;
      authState = AuthState.authenticated;

      notifyListeners();
    });
  }

  Future<void> deleteAccount(User currentUser) async {
    appState = AppState.submitting;
    notifyListeners();

    Either<Failure, void> result =
        await authRepository.deleteAccount(currentUser);

    result.fold((failure) {
      errorMessage = failure.errorMessage ??
          "An error occurred while trying to delete your account";
      appState = AppState.error;
      authState = AuthState.authenticated;
      notifyListeners();
    }, (success) {
      appState = AppState.success;
      authState = AuthState.unauthenticated;
      user = null;
      notifyListeners();
    });
  }

  ///Listen to Auth State Changes and update authentication state accordingly
  Future<void> authStateChanges() async {
    Either<Failure, Stream<User?>> result =
        await authRepository.getAuthStateChanges();

    result.fold((failure) {
      appState = AppState.error;
    }, (userStream) {
      userStream.listen((user) {
        if (user == null) {
          authState = AuthState.unauthenticated;
          notifyListeners();
        } else {
          authState = AuthState.authenticated;
          notifyListeners();
        }
      });
    });
  }
}
