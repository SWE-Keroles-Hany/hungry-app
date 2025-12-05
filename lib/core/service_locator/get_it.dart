import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hungry_app/core/network/dio_service.dart';
import 'package:hungry_app/features/auth/data/data_source/local/local_data_source.dart';
import 'package:hungry_app/features/auth/data/data_source/local/shared_pref_data_source.dart';
import 'package:hungry_app/features/auth/data/data_source/remote/auth_api_data_source.dart';
import 'package:hungry_app/features/auth/data/data_source/remote/auth_data_source.dart';
import 'package:hungry_app/features/auth/data/repository/auth_repository.dart';
import 'package:hungry_app/features/auth/domain/repository/auth_repository_imp.dart';
import 'package:hungry_app/features/auth/domain/use_cases/login.dart';
import 'package:hungry_app/features/auth/domain/use_cases/logout.dart';
import 'package:hungry_app/features/auth/domain/use_cases/sign_up.dart';
import 'package:hungry_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;
void setUp() {
  //! Auth
  getIt.registerSingleton<Dio>(Dio());

  getIt.registerSingleton<DioService>(DioService(getIt()));
  getIt.registerSingletonAsync<LocalDataSource>(() async {
    final prefs = await SharedPreferences.getInstance();
    return SharedPrefDataSource(prefs);
  });

  getIt.registerSingleton<AuthDataSource>(AuthAPIDataSource(getIt()));

  getIt.registerSingleton<AuthRepository>(AuthRepositoryImp(getIt()));
  getIt.registerSingleton<Login>(Login(getIt()));
  getIt.registerSingleton<Logout>(Logout(getIt()));
  getIt.registerSingleton<SignUp>(SignUp(getIt()));
  getIt.registerSingleton<AuthCubit>(AuthCubit(getIt(), getIt(), getIt()));
}
