import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class ProfileModel {
  final String? name;
  final String? email;
  final String? address;
  final String? imageUrl; // جاي من السيرفر
  final XFile? imageFile; // صورة محلية للرفع

  ProfileModel({
    this.name,
    this.email,
    this.address,
    this.imageUrl,
    this.imageFile,
  });

  // JSON → Model
  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      name: json['name']?.toString(),
      email: json['email']?.toString(),
      address: json['address']?.toString(),
      imageUrl: json['image']?.toString(),
    );
  }

  // Model → FormData
  Future<FormData> toFormData() async {
    final formData = FormData();

    if (name?.isNotEmpty == true) {
      formData.fields.add(MapEntry("name", name!));
    }
    if (email?.isNotEmpty == true) {
      formData.fields.add(MapEntry("email", email!));
    }
    if (address?.isNotEmpty == true) {
      formData.fields.add(MapEntry("address", address!));
    }

    if (imageFile != null) {
      formData.files.add(
        MapEntry(
          "image",  
          await MultipartFile.fromFile(
            imageFile!.path,
            filename: imageFile!.path.split('/').last,
          ),
        ),
      );
    }

    return formData;
  }
}
