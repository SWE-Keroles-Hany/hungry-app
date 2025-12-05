import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/error/failure.dart';
import 'package:hungry_app/features/auth/data/models/sign_up_model.dart';
import 'package:hungry_app/features/auth/data/repository/auth_repository.dart';

class SignUp {
  final AuthRepository _authRepository;
  SignUp(this._authRepository);
  Future<Either<Failure, void>> signUp({
    required SignUpModel signUpModel,
  }) async {
    return await _authRepository.signUp(signUpModel: signUpModel);
  }
}
