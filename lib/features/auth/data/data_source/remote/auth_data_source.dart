import 'package:hungry_app/features/auth/data/models/login_model.dart';
import 'package:hungry_app/features/auth/data/models/sign_up_model.dart';

abstract class AuthDataSource {
  Future<void> login({required LoginModel loginModel});
  Future<void> signUp({required SignUpModel signUpModel});
  Future<void> logOut();
}
