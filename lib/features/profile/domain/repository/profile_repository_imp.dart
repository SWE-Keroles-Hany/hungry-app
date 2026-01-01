import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/error/app_exceptions.dart';
import 'package:hungry_app/features/profile/data/data_source/profile_data_source.dart';
import 'package:hungry_app/features/profile/data/mappers/profile_entity_mapper.dart';
import 'package:hungry_app/features/profile/data/mappers/profile_model_mapper.dart';
import 'package:hungry_app/features/profile/data/repository/profile_repository.dart';
import 'package:hungry_app/features/profile/domain/entities/profile_entity.dart';

class ProfileRepositoryImp implements ProfileRepository {
  final ProfileDataSource _profileDataSource;
  ProfileRepositoryImp(this._profileDataSource);

  @override
  Future<Either<AppException, ProfileEntity>> getProfile() async {
    try {
      final profileModel = await _profileDataSource.getProfile();
      log(" Profile => ${profileModel.toEntity.name}");
      return Right(profileModel.toEntity);
    } on AppException catch (exception) {
      return Left(AppException(exception.message));
    } catch (_) {
      return Left(AppException("Some Thing Went Wrong"));
    }
  }

  @override
  Future<Either<AppException, void>> updateProfile({
    required ProfileEntity profile,
  }) async {
    try {
      await _profileDataSource.updateProfile(profileModel: profile.toModel);
      return Right(null);
    } on AppException catch (exception) {
      return Left(AppException(exception.message));
    } catch (_) {
      return Left(AppException("Some Thing Went Wrong"));
    }
  }
}
