import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/features/auth/data/mappers/login_entity_mapper.dart';
import 'package:hungry_app/features/auth/data/mappers/sign_up_entity_mapper.dart';
import 'package:hungry_app/features/auth/domain/entities/login_entity.dart';
import 'package:hungry_app/features/auth/domain/entities/sign_up_entity.dart';
import 'package:hungry_app/features/auth/domain/use_cases/is_logged_in.dart';
import 'package:hungry_app/features/auth/domain/use_cases/login.dart';
import 'package:hungry_app/features/auth/domain/use_cases/logout.dart';
import 'package:hungry_app/features/auth/domain/use_cases/sign_up.dart';
import 'package:hungry_app/features/auth/presentation/cubit/auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  final Login _login;
  final SignUp _signUp;
  final Logout _logout;
  final IsLoggedIn _isLoggedIn;

  AuthCubit(this._login, this._signUp, this._logout, this._isLoggedIn)
    : super(AuthIntialState());

  Future<void> login({required LoginEntity loginEntity}) async {
    emit(LoginLoadingState());
    final result = await _login.login(loginModel: loginEntity.toModel);
    result.fold(
      (exception) {
        emit(LoginErrorState(exception.message));
      },
      (_) {
        emit(LoginSuccessState());
      },
    );
  }

  Future<void> signUp({required SignUpEntity signUpEntity}) async {
    emit(SignUpLoadingState());
    final result = await _signUp.signUp(signUpModel: signUpEntity.toModel);
    result.fold(
      (exception) {
        emit(SignUpErrorState(exception.message));
      },
      (_) {
        emit(SignUpSuccessState());
      },
    );
  }

  Future<void> logout() async {
    emit(LogOutLoadingState());
    final result = await _logout.logout();
    result.fold(
      (exception) {
        emit(LogOutErrorState(exception.message));
      },
      (_) {
        emit(LogOutSuccessState());
      },
    );
  }

  Future<void> isLoggedIn() async {
    emit(IsLoggedInLoadingState());
    await Future.delayed(Duration(seconds: 2));
    final result = await _isLoggedIn.isLoggedIn();
    result.fold(
      (exception) {
        emit(IsLoggedInErrorState(exception.message));
      },
      (_) {
        emit(IsLoggedInSuccessState());
      },
    );
  }
}
