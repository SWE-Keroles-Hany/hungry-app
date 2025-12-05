class AuthResponseModel {
  final dynamic code;
  final String message;
  final UserData? data;

  AuthResponseModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      code: json['code'],
      message: json['message'],
      data: UserData.fromJson(json['data']),
    );
  }
}

class UserData {
  final String token;
  final String name;
  final String email;
  final String image;

  UserData({
    required this.token,
    required this.name,
    required this.email,
    required this.image,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      token: json['token'],
      name: json['name'],
      email: json['email'],
      image: json['image'],
    );
  }
}
