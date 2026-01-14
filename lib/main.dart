import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hungry_app/core/bloc/bloc_observer.dart';
import 'package:hungry_app/core/check_internet/internet_cubit.dart';
import 'package:hungry_app/core/check_internet/internet_states.dart';
import 'package:hungry_app/core/routes/app_routes.dart';
import 'package:hungry_app/core/service_locator/get_it.dart';
import 'package:hungry_app/core/theme/app_theme.dart';
import 'package:hungry_app/core/utils/ui_utils.dart';
import 'package:hungry_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:hungry_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:hungry_app/features/home/presentation/cubit/categories_cubit.dart';
import 'package:hungry_app/features/home/presentation/cubit/products_cubit.dart';
import 'package:hungry_app/features/home/presentation/cubit/side_options_cubt.dart';
import 'package:hungry_app/features/home/presentation/cubit/topping_cubit.dart';
import 'package:hungry_app/features/order_history/presentation/cubit/orders_cubit.dart';
import 'package:hungry_app/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:hungry_app/splash_screen.dart';
import 'package:toastification/toastification.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  setUp();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<AuthCubit>()..isLoggedIn()),
        BlocProvider(create: (_) => getIt<CartCubit>()..getCart()),
        BlocProvider(create: (_) => getIt<ProductsCubit>()..getProducts()),
        BlocProvider(create: (_) => getIt<ToppingsCubit>()..getToppings()),
        BlocProvider(
          create: (_) => getIt<SideOptionsCubit>()..getSideOptions(),
        ),
        BlocProvider(
          create: (_) => getIt<CategoriesCubit>()..getAllCategorires(),
        ),
        BlocProvider(create: (_) => getIt<OrdersCubit>()..getAllOrders()),
        BlocProvider(create: (_) => getIt<ProfileCubit>()..getProfile()),
        BlocProvider(create: (_) => InternetCubit()..checkInternet()),
      ],
      child: const HungryApp(),
    ),
  );
}

class HungryApp extends StatelessWidget {
  const HungryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(430, 932),
      builder: (context, child) {
        return ToastificationWrapper(
          child: BlocListener<InternetCubit, InternetStates>(
            listener: (context, state) {
              if (state is NotConnectedInternetState) {
                UiUtils.noInternetConnection();
              } else if (state is ConnectedInternetState) {
                Get.back();
              }
            },
            child: GetMaterialApp(
              theme: AppTheme.theme,
              debugShowCheckedModeBanner: false,
              initialRoute: SplashScreen.routeName,
              routes: AppRoutes.routes,
            ),
          ),
        );
      },
    );
  }
}
