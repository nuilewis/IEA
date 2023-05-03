import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:water_project/core/connection_checker/connection_checker.dart';

import '../core/errors/failure.dart';
import '../models/auth_models.dart';
import '../services/auth/auth_service.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> signInWithEmail(
      {required SignInParameters parameters});
  Future<Either<Failure, void>> signInWithGoogle();
  Future<Either<Failure, void>> registerWithEmail(
      {required RegisterParameters parameters});
  Future<Either<Failure, void>> updateAccountInfo();
  Future<Either<Failure, void>> deleteAccount();
}

class AuthRepositoryImplementation implements AuthRepository {
  final AuthService authService;
  final ConnectionChecker connectionChecker;

  AuthRepositoryImplementation(
      {required this.authService, required this.connectionChecker});
  @override
  Future<Either<Failure, void>> deleteAccount() async {
    if (await connectionChecker.isConnected) {
      try {
        await authService.deleteAccount();
        return const Right(null);
      } on FirebaseException catch (e) {
        return Left(FirebaseFailure(errorMessage: e.message));
      } catch (e) {
        return const Left(FirebaseFailure(
            errorMessage: "An error occurred while trying to delete account"));
      }
    } else {
      return const Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, void>> registerWithEmail(
      {required RegisterParameters parameters}) async {
    if (await connectionChecker.isConnected) {
      try {
        await authService.registerWithEmail(parameters: parameters);
        return const Right(null);
      } on FirebaseException catch (e) {
        return Left(FirebaseFailure(errorMessage: e.message));
      } catch (e) {
        return const Left(FirebaseFailure(
            errorMessage: "An error occurred while trying to register"));
      }
    } else {
      return const Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, void>> signInWithEmail(
      {required SignInParameters parameters}) async {
    if (await connectionChecker.isConnected) {
      try {
        await authService.signInWithEmail(parameters: parameters);
        return const Right(null);
      } on FirebaseException catch (e) {
        return Left(FirebaseFailure(errorMessage: e.message));
      } catch (e) {
        return const Left(FirebaseFailure(
            errorMessage: "An error occurred while trying to sign in"));
      }
    } else {
      return const Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateAccountInfo() async {
    if (await connectionChecker.isConnected) {
      try {
        await authService.updateAccountInfo();
        return const Right(null);
      } on FirebaseException catch (e) {
        return Left(FirebaseFailure(errorMessage: e.message));
      } catch (e) {
        return const Left(FirebaseFailure(
            errorMessage: "An error occurred while trying update Info"));
      }
    } else {
      return const Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, void>> signInWithGoogle() async {
    if (await connectionChecker.isConnected) {
      try {
        await authService.signInWithGoogle();
        return const Right(null);
      } on FirebaseException catch (e) {
        return Left(FirebaseFailure(errorMessage: e.message));
      } catch (e) {
        return const Left(
          FirebaseFailure(
              errorMessage:
                  "An error occurred while trying to sing in With Google"),
        );
      }
    } else {
      return const Left(NetworkFailure());
    }
  }
}
