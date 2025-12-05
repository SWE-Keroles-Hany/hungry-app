import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/features/auth/data/mappers/login_entity_mapper.dart';
import 'package:hungry_app/features/auth/data/mappers/sign_up_entity_mapper.dart';
import 'package:hungry_app/features/auth/domain/entities/login_entity.dart';
import 'package:hungry_app/features/auth/domain/entities/sign_up_entity.dart';
import 'package:hungry_app/features/auth/domain/use_cases/login.dart';
import 'package:hungry_app/features/auth/domain/use_cases/logout.dart';
import 'package:hungry_app/features/auth/domain/use_cases/sign_up.dart';
import 'package:hungry_app/features/auth/presentation/cubit/auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  final Login _login;
  final SignUp _signUp;
  final Logout _logout;

  AuthCubit(this._login, this._signUp, this._logout) : super(AuthIntialState());

  Future<void> login({required LoginEntity loginEntity}) async {
    emit(LoginLoadingState());
    final result = await _login.login(loginModel: loginEntity.toModel);
    result.fold(
      (failure) {
        emit(LoginErrorState(failure.message));
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
      (failure) {
        emit(SignUpErrorState(failure.message));
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
      (failure) {
        emit(LogOutErrorState(failure.message));
      },
      (_) {
        emit(LogOutSuccessState());
      },
    );
  }
}
