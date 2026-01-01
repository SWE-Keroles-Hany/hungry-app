import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hungry_app/features/profile/domain/entities/profile_entity.dart';
import 'package:hungry_app/features/profile/domain/use_cases/get_profile.dart';
import 'package:hungry_app/features/profile/domain/use_cases/update_profile.dart';
import 'package:hungry_app/features/profile/presentation/cubit/profile_states.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  final UpdateProfile _updateProfile;
  final GetProfile _getProfile;

  ProfileCubit(this._getProfile, this._updateProfile)
    : super(IntialProfileState());

  Future<void> updateProfile({required ProfileEntity profile}) async {
    emit(LoadingUpdateProfileState());
    final result = await _updateProfile.updateProfile(profile: profile);
    result.fold(
      (failure) {
        emit(ErrorUpdateProfileState(failure.message));
      },
      (_) {
        emit(SuccessUpdateProfileState());
      },
    );
  }

  Future<void> getProfile() async {
    emit(LoadingGetProfileState());
    final result = await _getProfile.getProfile();
    result.fold(
      (failure) {
        emit(ErrorGetProfileState(failure.message));
      },
      (profile) {
        emit(SuccessGetProfileState(profile));
      },
    );
  }
}
