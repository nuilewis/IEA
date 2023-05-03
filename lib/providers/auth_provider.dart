import 'package:dartz/dartz.dart';
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
  AuthProvider({required this.authRepository});

  Future<void> signInWithEmail(SignInParameters parameters) async {

    appState = AppState.submitting;
    notifyListeners();

    Either<Failure, void> result =
        await authRepository.signInWithEmail(parameters: parameters);

    result.fold((failure) {
      errorMessage =
          failure.errorMessage ?? "An error occurred while trying to sign in";
      appState = AppState.error;
      authState = AuthState.unauthenticated;
      notifyListeners();
    }, (success) {
      appState = AppState.success;
      authState = AuthState.authenticated;

      ///Todo: get user credential after login
      ///therefore the sgn in method will return a user and no longer void
      notifyListeners();
    });
  }

  Future<void> registerWithEmail(RegisterParameters parameters) async {

    appState = AppState.submitting;
    notifyListeners();

    Either<Failure, void> result =
    await authRepository.registerWithEmail(parameters: parameters);

    result.fold((failure) {
      errorMessage =
          failure.errorMessage ?? "An error occurred while trying to register";
      appState = AppState.error;
      authState = AuthState.unauthenticated;
      notifyListeners();
    }, (success) {
      appState = AppState.success;
      authState = AuthState.authenticated;

      ///Todo: get user credential after login
      ///therefore the sgn in method will return a user and no longer void
      notifyListeners();
    });

  }

  Future<void> signInWithGoogle() async {

    appState = AppState.submitting;
    notifyListeners();

    Either<Failure, void> result =
    await authRepository.signInWithGoogle();

    result.fold((failure) {
      errorMessage =
          failure.errorMessage ?? "An error occurred while trying to sign in with Google";
      appState = AppState.error;
      authState = AuthState.unauthenticated;
      notifyListeners();
    }, (success) {
      appState = AppState.success;
      authState = AuthState.authenticated;

      ///Todo: get user credential after login
      ///therefore the sgn in method will return a user and no longer void
      notifyListeners();
    });
  }
  Future<void> updateAccountInfo() async {

    appState = AppState.submitting;
    notifyListeners();

    Either<Failure, void> result =
    await authRepository.updateAccountInfo();

    result.fold((failure) {
      errorMessage =
          failure.errorMessage ?? "An error occurred while trying to update your information";
      appState = AppState.error;
      authState = AuthState.unauthenticated;
      notifyListeners();
    }, (success) {
      appState = AppState.success;
      authState = AuthState.authenticated;

      notifyListeners();
    });
  }
  Future<void> deleteAccount() async {

    appState = AppState.submitting;
    notifyListeners();

    Either<Failure, void> result =
    await authRepository.deleteAccount();

    result.fold((failure) {
      errorMessage =
          failure.errorMessage ?? "An error occurred while trying to delete your account";
      appState = AppState.error;
      authState = AuthState.authenticated;
      notifyListeners();
    }, (success) {
      appState = AppState.success;
      authState = AuthState.unauthenticated;

      ///Todo: get user credential after login
      ///therefore the sgn in method will return a user and no longer void
      notifyListeners();
    });
  }
}
