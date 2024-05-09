import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fpdart/fpdart.dart';
import 'package:water_project/models/auth_models.dart';

import '../core/enums/app_state_enum.dart';
import '../core/enums/auth_state_enum.dart';
import '../core/errors/failure.dart';
import '../repositories/auth_repository.dart';

class AuthProvider extends ChangeNotifier {
  @override
  build() => null;

  AuthRepository authRepository;
  String errorMessage = "";
  AppState appState = AppState.initial;
  AuthState authState = AuthState.unauthenticated;
  User? user;

  AuthProvider({required this.authRepository});

  Future<void> signInWithEmail(SignInParameters parameters) async {
    appState = AppState.submitting;

    Either<Failure, User?> result =
        await authRepository.signInWithEmail(parameters: parameters);

    result.fold((failure) {
      errorMessage =
          failure.errorMessage ?? "An error occurred while trying to sign in";
      appState = AppState.error;
      authState = AuthState.unauthenticated;
    }, (signedInUser) {
      appState = AppState.success;
      authState = AuthState.authenticated;
      user = signedInUser;
    });
  }

  Future<void> registerWithEmail(RegisterParameters parameters) async {
    appState = AppState.submitting;

    Either<Failure, User?> result =
        await authRepository.registerWithEmail(parameters: parameters);

    result.fold((failure) {
      errorMessage =
          failure.errorMessage ?? "An error occurred while trying to register";
      appState = AppState.error;
      authState = AuthState.unauthenticated;
    }, (registeredUser) {
      appState = AppState.success;
      authState = AuthState.authenticated;
      user = registeredUser;
    });
  }

  Future<void> signInWithGoogle() async {
    appState = AppState.submitting;

    Either<Failure, User?> result = await authRepository.signInWithGoogle();

    result.fold((failure) {
      errorMessage = failure.errorMessage ??
          "An error occurred while trying to sign in with Google";
      appState = AppState.error;
      authState = AuthState.unauthenticated;
    }, (signedInUser) {
      appState = AppState.success;
      authState = AuthState.authenticated;
      user = signedInUser;
    });
  }

  Future<void> updateAccountInfo() async {
    appState = AppState.submitting;

    Either<Failure, void> result = await authRepository.updateAccountInfo();

    result.fold((failure) {
      errorMessage = failure.errorMessage ??
          "An error occurred while trying to update your information";
      appState = AppState.error;
      authState = AuthState.unauthenticated;
    }, (success) {
      appState = AppState.success;
      authState = AuthState.authenticated;
    });
  }

  Future<void> deleteAccount(User currentUser) async {
    appState = AppState.submitting;

    Either<Failure, void> result =
        await authRepository.deleteAccount(currentUser);

    result.fold((failure) {
      errorMessage = failure.errorMessage ??
          "An error occurred while trying to delete your account";
      appState = AppState.error;
      authState = AuthState.authenticated;
    }, (success) {
      appState = AppState.success;
      authState = AuthState.unauthenticated;
      user = null;
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
        } else {
          authState = AuthState.authenticated;
        }
      });
    });
  }
}
