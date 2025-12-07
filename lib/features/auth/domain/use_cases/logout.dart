import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/error/app_exceptions.dart';
import 'package:hungry_app/features/auth/data/repository/auth_repository.dart';

class Logout {
  final AuthRepository _authRepository;
  Logout(this._authRepository);
  Future<Either<AppException, void>> logout() async {
    return await _authRepository.logOut();
  }
}
