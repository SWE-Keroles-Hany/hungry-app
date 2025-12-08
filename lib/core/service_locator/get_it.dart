import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hungry_app/core/network/dio_service.dart';
import 'package:hungry_app/features/auth/data/data_source/local/local_data_source.dart';
import 'package:hungry_app/features/auth/data/data_source/local/shared_pref_data_source.dart';
import 'package:hungry_app/features/auth/data/data_source/remote/auth_api_data_source.dart';
import 'package:hungry_app/features/auth/data/data_source/remote/auth_data_source.dart';
import 'package:hungry_app/features/auth/data/repository/auth_repository.dart';
import 'package:hungry_app/features/auth/domain/repository/auth_repository_imp.dart';
import 'package:hungry_app/features/auth/domain/use_cases/is_logged_in.dart';
import 'package:hungry_app/features/auth/domain/use_cases/login.dart';
import 'package:hungry_app/features/auth/domain/use_cases/logout.dart';
import 'package:hungry_app/features/auth/domain/use_cases/sign_up.dart';
import 'package:hungry_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:hungry_app/features/home/data/data_source/categories_api_data_source.dart';
import 'package:hungry_app/features/home/data/data_source/categories_data_source.dart';
import 'package:hungry_app/features/home/data/data_source/products_api_data_source.dart';
import 'package:hungry_app/features/home/data/data_source/products_data_source.dart';
import 'package:hungry_app/features/home/data/repository/categories_repository.dart';
import 'package:hungry_app/features/home/data/repository/products_repository.dart';
import 'package:hungry_app/features/home/domain/repository/categories_repository_imp.dart';
import 'package:hungry_app/features/home/domain/repository/products_repository_imp.dart';
import 'package:hungry_app/features/home/domain/use_cases/get_all_categories.dart';
import 'package:hungry_app/features/home/domain/use_cases/get_products_by_name.dart';
import 'package:hungry_app/features/home/domain/use_cases/get_side_options_products.dart';
import 'package:hungry_app/features/home/domain/use_cases/get_toppings_products.dart';
import 'package:hungry_app/features/home/presentation/cubit/categories_cubit.dart';
import 'package:hungry_app/features/home/presentation/cubit/products_cubit.dart';

final getIt = GetIt.instance;
void setUp() {
  //! Auth
  getIt.registerSingleton<Dio>(Dio());

  getIt.registerSingleton<DioService>(DioService(getIt()));
  getIt.registerSingleton<LocalDataSource>(SharedPrefDataSource());

  getIt.registerSingleton<AuthDataSource>(AuthAPIDataSource(getIt()));

  getIt.registerSingleton<AuthRepository>(AuthRepositoryImp(getIt(), getIt()));
  getIt.registerSingleton<Login>(Login(getIt()));
  getIt.registerSingleton<Logout>(Logout(getIt()));
  getIt.registerSingleton<SignUp>(SignUp(getIt()));
  getIt.registerSingleton<IsLoggedIn>(IsLoggedIn(getIt()));

  getIt.registerSingleton<AuthCubit>(
    AuthCubit(getIt(), getIt(), getIt(), getIt()),
  );
  //! Products & Categoires
  getIt.registerSingleton<ProductsDataSource>(ProductsAPIDataSource(getIt()));
  getIt.registerSingleton<CategoriesDataSource>(
    CategoriesAPIDataSource(getIt()),
  );
  getIt.registerSingleton<CategoriesRepository>(
    CategoriesRepositoryImp(getIt()),
  );
  getIt.registerSingleton<ProductsRepository>(
    ProductsRepositoryImp(getIt(), getIt()),
  );
  getIt.registerSingleton<GetAllCategories>(GetAllCategories(getIt()));
  getIt.registerSingleton<GetProducts>(GetProducts(getIt()));
  getIt.registerSingleton<GetSideOptionsProducts>(
    GetSideOptionsProducts(getIt()),
  );
  getIt.registerSingleton<GetToppingsProducts>(GetToppingsProducts(getIt()));

  getIt.registerFactory<ProductsCubit>(
    () => ProductsCubit(getIt(), getIt(), getIt()),
  );
  getIt.registerFactory<CategoriesCubit>(() => CategoriesCubit(getIt()));
}
