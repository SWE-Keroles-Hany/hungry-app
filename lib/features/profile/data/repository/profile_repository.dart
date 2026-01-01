import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/error/app_exceptions.dart';
import 'package:hungry_app/features/profile/domain/entities/profile_entity.dart';

abstract class ProfileRepository {
  Future<Either<AppException, void>> updateProfile({
    required ProfileEntity profile,
  });
  Future<Either<AppException, ProfileEntity>> getProfile();
}
