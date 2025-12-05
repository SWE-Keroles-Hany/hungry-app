import 'package:hungry_app/core/constants/api_constants.dart';
import 'package:hungry_app/core/error/app_exceptions.dart';
import 'package:hungry_app/core/network/dio_service.dart';
import 'package:hungry_app/features/auth/data/data_source/remote/auth_data_source.dart';
import 'package:hungry_app/features/auth/data/models/auth_response_model.dart';
import 'package:hungry_app/features/auth/data/models/login_model.dart';
import 'package:hungry_app/features/auth/data/models/sign_up_model.dart';

class AuthAPIDataSource implements AuthDataSource {
  final DioService dio;
  AuthAPIDataSource(this.dio);
  @override
  Future<AuthResponseModel> login({required LoginModel loginModel}) async {
    try {
      final response = await dio.post(
        endPoint: APIConstants.login,
        data: {'email': loginModel.email, 'password': loginModel.password},
      );
      final loginResponse = AuthResponseModel.fromJson(response);
      return loginResponse;
    } on AppException catch (exception) {
      throw AppException(exception.message);
    }
  }

  @override
  Future<AuthResponseModel> logOut() async {
    try {
      final response = await dio.post(endPoint: APIConstants.logout);
      final logOutResponse = AuthResponseModel.fromJson(response);
      return logOutResponse;
    } on AppException catch (exception) {
      throw AppException(exception.message);
    }
  }

  @override
  Future<AuthResponseModel> signUp({required SignUpModel signUpModel}) async {
    try {
      final response = await dio.post(
        endPoint: APIConstants.signUp,
        data: {
          'email': signUpModel.email,
          'password': signUpModel.password,
          'name': signUpModel.name,
        },
      );
      final signUpResponse = AuthResponseModel.fromJson(response);
      return signUpResponse;
    } on AppException catch (exception) {
      throw AppException(exception.message);
    }
  }
}
