import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/error/app_exceptions.dart';
import 'package:hungry_app/core/error/failure.dart';
import 'package:hungry_app/features/auth/data/data_source/remote/auth_data_source.dart';
import 'package:hungry_app/features/auth/data/models/login_model.dart';
import 'package:hungry_app/features/auth/data/models/sign_up_model.dart';
import 'package:hungry_app/features/auth/data/repository/auth_repository.dart';

class AuthRepositoryImp implements AuthRepository {
  final AuthDataSource _authDataSource;
  AuthRepositoryImp(this._authDataSource);
  @override
  Future<Either<Failure, void>> logOut() async {
    try {
      await _authDataSource.logOut();
      return Right(null);
    } on AppException catch (exception) {
      return Left(Failure(exception.message));
    }
  }

  @override
  Future<Either<Failure, void>> login({required LoginModel loginModel}) async {
    try {
      await _authDataSource.login(loginModel: loginModel);
      return Right(null);
    } on AppException catch (exception) {
      return Left(Failure(exception.message));
    }
  }

  @override
  Future<Either<Failure, void>> signUp({
    required SignUpModel signUpModel,
  }) async {
    try {
      await _authDataSource.signUp(signUpModel: signUpModel);
      return Right(null);
    } on AppException catch (exception) {
      return Left(Failure(exception.message));
    }
  }
}
