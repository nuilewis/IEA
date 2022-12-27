import 'package:dartz/dartz.dart';

import '../core/errors/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> signIn();
  Future<Either<Failure, void>> register();
  Future<Either<Failure, void>> updateAccountInfo();
  Future<Either<Failure, void>> deleteAccount();
}

class AuthRepositoryImplementation implements AuthRepository {
  @override
  Future<Either<Failure, void>> deleteAccount() {
    // TODO: implement deleteAccount
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> register() {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> signIn() {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateAccountInfo() {
    // TODO: implement updateAccountInfo
    throw UnimplementedError();
  }
}
