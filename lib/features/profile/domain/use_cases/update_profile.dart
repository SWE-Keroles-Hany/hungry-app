import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/error/app_exceptions.dart';
import 'package:hungry_app/features/profile/data/repository/profile_repository.dart';
import 'package:hungry_app/features/profile/domain/entities/profile_entity.dart';

class UpdateProfile {
  final ProfileRepository _profileRepository;
  UpdateProfile(this._profileRepository);
  Future<Either<AppException, void>> updateProfile({
    required ProfileEntity profile,
  }) async {
    return await _profileRepository.updateProfile(profile: profile);
  }
}
