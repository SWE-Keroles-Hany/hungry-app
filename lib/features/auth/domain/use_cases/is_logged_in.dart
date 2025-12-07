import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/error/app_exceptions.dart';
import 'package:hungry_app/features/auth/data/repository/auth_repository.dart';

class IsLoggedIn {
  final AuthRepository _authRepository;
  IsLoggedIn(this._authRepository);
  Future<Either<AppException, void>> isLoggedIn() async {
    return await _authRepository.isLoggedIn();
  }
}
