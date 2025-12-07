import 'package:flutter/material.dart';
import 'package:hungry_app/features/auth/presentation/screens/login_screen.dart';
import 'package:hungry_app/features/checkout/presentation/screens/checkout_screen.dart';
import 'package:hungry_app/features/home/presentation/screens/product_details_screen.dart';
import 'package:hungry_app/features/home/presentation/screens/home_screen.dart';
import 'package:hungry_app/splash_screen.dart';

import '../../features/auth/presentation/screens/sign_up_screen.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    HomeScreen.routeName: (context) => HomeScreen(),
    SplashScreen.routeName: (context) => SplashScreen(),
    LoginScreen.routeName: (context) => LoginScreen(),
    SignUpScreen.routeName: (context) => SignUpScreen(),
    ProductDetailsScreen.routeName: (context) => ProductDetailsScreen(),
    CheckoutScreen.routeName: (context) => CheckoutScreen(),
  };
}
