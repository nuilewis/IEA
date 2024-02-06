import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:water_project/core/connection_checker/connection_checker.dart';

import '../core/errors/failure.dart';
import '../models/auth_models.dart';
import '../services/auth/auth_service.dart';


class AuthRepository {
  final AuthService authService;
  final ConnectionChecker connectionChecker;

  AuthRepository({
    required this.authService,
    required this.connectionChecker,
  });


  Future<Either<Failure, void>> deleteAccount(User user) async {
    if (await connectionChecker.isConnected) {
      try {
        await authService.deleteAccount(user);
        return const Right(null);
      } on FirebaseAuthException catch (e) {
        //If an authentication error occurs, return an failure with the error message;
        return Left(Failure.firebase(errorMessage: e.message));
      } on FirebaseException catch (e) {
        return Left(Failure.firebase(errorMessage: e.message));
      } catch (e) {
        return const Left(Failure.firebase(
            errorMessage: "An error occurred while trying to delete account"));
      }
    } else {
      return const Left(Failure.network());    }
  }


  Future<Either<Failure, User?>> registerWithEmail(
      {required RegisterParameters parameters}) async {
    if (await connectionChecker.isConnected) {
      try {
        final UserCredential userCredential =
            await authService.registerWithEmail(parameters: parameters);
        return Right(userCredential.user);
      } on FirebaseAuthException catch (e) {
        //If an authentication error occurs, return an failure with the error message;
        return Left(Failure.firebase(errorMessage: e.message));
      } on FirebaseException catch (e) {
        return Left(Failure.firebase(errorMessage: e.message));
      } catch (e) {
        return const Left(Failure.firebase(
            errorMessage: "An error occurred while trying to register"));
      }
    } else {
      return const Left(Failure.network());    }
  }


  Future<Either<Failure, User?>> signInWithEmail(
      {required SignInParameters parameters}) async {
    if (await connectionChecker.isConnected) {
      try {
        final UserCredential userCredential =
            await authService.signInWithEmail(parameters: parameters);
        return Right(userCredential.user);
      } on FirebaseAuthException catch (e) {
        //If an authentication error occurs, return an failure with the error message;
        return Left(Failure.firebase(errorMessage: e.message));
      } on FirebaseException catch (e) {
        return Left(Failure.firebase(errorMessage: e.message));
      } catch (e) {
        return const Left(Failure.firebase(
            errorMessage: "An error occurred while trying to sign in"));
      }
    } else {
      return const Left(Failure.network());    }
  }


  Future<Either<Failure, void>> updateAccountInfo() async {
    if (await connectionChecker.isConnected) {
      try {
        await authService.updateAccountInfo();
        return const Right(null);
      } on FirebaseAuthException catch (e) {
        //If an authentication error occurs, return an failure with the error message;
        return Left(Failure.firebase(errorMessage: e.message));
      } on FirebaseException catch (e) {
        return Left(Failure.firebase(errorMessage: e.message));
      } catch (e) {
        return const Left(Failure.firebase(
            errorMessage: "An error occurred while trying update Info"));
      }
    } else {
      return const Left(Failure.network());    }
  }


  Future<Either<Failure, User?>> signInWithGoogle() async {
    if (await connectionChecker.isConnected) {
      try {
        final UserCredential userCredential =
            await authService.signInWithGoogle();
        return Right(userCredential.user);
      } on FirebaseAuthException catch (e) {
        //If an authentication error occurs, return an failure with the error message;
        return Left(Failure.firebase(errorMessage: e.message));
      } on FirebaseException catch (e) {
        return Left(Failure.firebase(errorMessage: e.message));
      } catch (e) {
        return const Left(
          Failure.firebase(
              errorMessage:
                  "An error occurred while trying to sing in With Google"),
        );
      }
    } else {
      return const Left(Failure.network());    }
  }


  Future<Either<Failure, Stream<User?>>> getAuthStateChanges() async {
    try {
      Stream<User?> authStateStream = authService.getAuthStateChanges();

      return Right(authStateStream);
    } on FirebaseAuthException catch (e) {
      //If an authentication error occurs, return an failure with the error message;
      return Left(Failure.firebase(errorMessage: e.message));
    } on FirebaseException catch (e) {
      return Left(Failure.firebase(errorMessage: e.message));
    } catch (e) {
      return const Left(
        Failure.firebase(
            errorMessage:
                "An error occurred while trying to sing in With Google"),
      );
    }
  }
}
