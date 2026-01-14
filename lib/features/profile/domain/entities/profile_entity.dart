import 'dart:io';

class ProfileEntity {
  String? name;
  String? email;
  String? address;
  String? phone;
  String? imagePath;
  File? imageFile;

  ProfileEntity({
    this.imageFile,
    this.name,
    this.email,
    this.address,
    this.phone,
    this.imagePath,
  });
}
