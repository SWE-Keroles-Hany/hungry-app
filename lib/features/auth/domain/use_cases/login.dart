import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/error/app_exceptions.dart';
import 'package:hungry_app/features/auth/data/models/login_model.dart';
import 'package:hungry_app/features/auth/data/repository/auth_repository.dart';

class Login {
  final AuthRepository _authRepository;
  Login(this._authRepository);
  Future<Either<AppException, void>> login({
    required LoginModel loginModel,
  }) async {
    return await _authRepository.login(loginModel: loginModel);
  }
}
