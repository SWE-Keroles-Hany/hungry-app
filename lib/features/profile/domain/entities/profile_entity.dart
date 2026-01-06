import 'dart:io';

import 'package:image_picker/image_picker.dart';

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
