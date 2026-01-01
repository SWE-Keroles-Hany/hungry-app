import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/error/app_exceptions.dart';
import 'package:hungry_app/features/profile/data/repository/profile_repository.dart';
import 'package:hungry_app/features/profile/domain/entities/profile_entity.dart';

class GetProfile {
  final ProfileRepository _profileRepository;
  GetProfile(this._profileRepository);
  Future<Either<AppException, ProfileEntity>> getProfile() async {
    return await _profileRepository.getProfile();
  }
}
