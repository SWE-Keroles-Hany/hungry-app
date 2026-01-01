import 'dart:developer';

import 'package:hungry_app/core/constants/api_constants.dart';
import 'package:hungry_app/core/error/app_exceptions.dart';
import 'package:hungry_app/core/network/dio_service.dart';
import 'package:hungry_app/features/profile/data/data_source/profile_data_source.dart';
import 'package:hungry_app/features/profile/data/models/profile_response_model.dart';

class ProfileAPIDataSource implements ProfileDataSource {
  final DioService dio;
  ProfileAPIDataSource(this.dio);
  @override
  Future<void> updateProfile({required ProfileModel profileModel}) async {
    try {
      await dio.post(
        data: await profileModel.toFormData(),
        endPoint: APIConstants.updateProfile,
      );
    } on AppException catch (exception) {
      log(exception.message);
      throw AppException(exception.message);
    } catch (error) {
      log(error.toString());
      throw AppException("Some Thing Went Wrong");
    }
  }

  @override
  Future<ProfileModel> getProfile() async {
    try {
      final json = await dio.get(endPoint: APIConstants.profile);
      log(json.toString());
      return ProfileModel.fromJson(json['data']);
    } on AppException catch (exception) {
      throw AppException(exception.message);
    } catch (_) {
      throw AppException("Some Thing Went Wrong");
    }
  }
}
