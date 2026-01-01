import 'package:hungry_app/features/auth/data/models/auth_response_model.dart';
import 'package:hungry_app/features/auth/data/models/login_model.dart';
import 'package:hungry_app/features/auth/data/models/sign_up_model.dart';

abstract class AuthDataSource {
  Future<AuthResponseModel> login({required LoginModel loginModel});
  Future<AuthResponseModel> signUp({required SignUpModel signUpModel});
  Future<void> logOut();
}
