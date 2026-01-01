import 'package:hungry_app/features/profile/data/models/profile_response_model.dart';
import 'package:hungry_app/features/profile/domain/entities/profile_entity.dart';

extension ProfileEntityMapper on ProfileEntity {
  ProfileModel get toModel => ProfileModel(
    name: name,
    email: email,
    address: address,
    imageUrl: imagePath,
    imageFile: imageFile,
  );
}
