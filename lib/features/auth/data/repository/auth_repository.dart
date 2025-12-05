import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/error/failure.dart';
import 'package:hungry_app/features/auth/data/models/login_model.dart';
import 'package:hungry_app/features/auth/data/models/sign_up_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> login({required LoginModel loginModel});
  Future<Either<Failure, void>> logOut();
  Future<Either<Failure, void>> signUp({required SignUpModel signUpModel});
}
