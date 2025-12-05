import 'package:hungry_app/features/auth/data/models/sign_up_model.dart';
import 'package:hungry_app/features/auth/domain/entities/sign_up_entity.dart';

extension SignUpEntityMapper on SignUpEntity {
  SignUpModel get toModel => SignUpModel(email, password, name);
}
