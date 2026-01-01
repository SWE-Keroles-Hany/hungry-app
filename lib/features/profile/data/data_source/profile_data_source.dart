import 'package:hungry_app/features/profile/data/models/profile_response_model.dart';

abstract class ProfileDataSource {
  Future<void> updateProfile({required ProfileModel profileModel});
  Future<ProfileModel> getProfile();
}
