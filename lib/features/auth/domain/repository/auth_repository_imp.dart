import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/error/app_exceptions.dart';
import 'package:hungry_app/features/auth/data/data_source/local/local_data_source.dart';
import 'package:hungry_app/features/auth/data/data_source/remote/auth_data_source.dart';
import 'package:hungry_app/features/auth/data/models/login_model.dart';
import 'package:hungry_app/features/auth/data/models/sign_up_model.dart';
import 'package:hungry_app/features/auth/data/repository/auth_repository.dart';

class AuthRepositoryImp implements AuthRepository {
  final AuthDataSource _authDataSource;
  final LocalDataSource _localDataSource;

  AuthRepositoryImp(this._authDataSource, this._localDataSource);
  @override
  Future<Either<AppException, void>> logOut() async {
    try {
      await _authDataSource.logOut();
      return Right(null);
    } on AppException catch (exception) {
      return Left(AppException(exception.message));
    }
  }

  @override
  Future<Either<AppException, void>> login({
    required LoginModel loginModel,
  }) async {
    try {
      final loginResponse = await _authDataSource.login(loginModel: loginModel);
      final token = loginResponse.userModel!.token;
      await _localDataSource.setToken(token: token);
      return Right(null);
    } on AppException catch (exception) {
      return Left(AppException(exception.message));
    }
  }

  @override
  Future<Either<AppException, void>> signUp({
    required SignUpModel signUpModel,
  }) async {
    try {
      final signUpResponse = await _authDataSource.signUp(
        signUpModel: signUpModel,
      );
      final token = signUpResponse.userModel!.token;
      await _localDataSource.setToken(token: token);
      return Right(null);
    } on AppException catch (exception) {
      return Left(AppException(exception.message));
    }
  }

  @override
  Future<Either<AppException, void>> isLoggedIn() async {
    try {
      final result = await _localDataSource.getToken();
      if (result == null) return Left(AppException("Not Registered"));
      return Right(null);
    } on AppException catch (exception) {
      return Left(AppException(exception.message));
    }
  }
}
