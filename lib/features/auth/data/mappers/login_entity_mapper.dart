import 'package:hungry_app/features/auth/data/models/login_model.dart';
import 'package:hungry_app/features/auth/domain/entities/login_entity.dart';

extension LoginEntityMapper on LoginEntity {
  LoginModel get toModel => LoginModel(email, password);
}
