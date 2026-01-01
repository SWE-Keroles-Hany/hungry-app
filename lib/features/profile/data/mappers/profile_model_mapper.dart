import 'package:hungry_app/features/profile/data/models/profile_response_model.dart';
import 'package:hungry_app/features/profile/domain/entities/profile_entity.dart';

extension ProfileModelMapper on ProfileModel {
  ProfileEntity get toEntity => ProfileEntity(
    name: name,
    email: email,
    address: address,
    imagePath: imageUrl,
    imageFile: imageFile,
  );
}
