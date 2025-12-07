import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/error/app_exceptions.dart';
import 'package:hungry_app/features/auth/data/models/login_model.dart';
import 'package:hungry_app/features/auth/data/models/sign_up_model.dart';

abstract class AuthRepository {
  Future<Either<AppException, void>> login({required LoginModel loginModel});
  Future<Either<AppException, void>> logOut();
  Future<Either<AppException, void>> signUp({required SignUpModel signUpModel});
  Future<Either<AppException, void>> isLoggedIn();
}
