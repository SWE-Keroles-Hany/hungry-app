import 'package:hungry_app/features/auth/data/models/user_model.dart';

class AuthResponseModel {
  final dynamic code;
  final String message;
  final UserModel? userModel;

  AuthResponseModel({
    required this.code,
    required this.message,
    required this.userModel,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      code: json['code'],
      message: json['message'],
      userModel: UserModel.fromJson(json['data']),
    );
  }
}
