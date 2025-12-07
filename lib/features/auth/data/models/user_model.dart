class UserModel {
  final String token;
  final String name;
  final String email;
  final String image;

  UserModel({
    required this.token,
    required this.name,
    required this.email,
    required this.image,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      token: json['token'],
      name: json['name'],
      email: json['email'],
      image: json['image'],
    );
  }
}
