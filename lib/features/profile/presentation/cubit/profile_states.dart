import 'package:hungry_app/features/profile/domain/entities/profile_entity.dart';

abstract class ProfileStates {}

class IntialProfileState implements ProfileStates {}
// update

class ErrorUpdateProfileState implements ProfileStates {
  final String message;
  ErrorUpdateProfileState(this.message);
}

class LoadingUpdateProfileState implements ProfileStates {}

class SuccessUpdateProfileState implements ProfileStates {}

// get
class ErrorGetProfileState implements ProfileStates {
  final String message;
  ErrorGetProfileState(this.message);
}

class LoadingGetProfileState implements ProfileStates {}

class SuccessGetProfileState implements ProfileStates {
  final ProfileEntity profile;
  SuccessGetProfileState(this.profile);
}
