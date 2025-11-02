import 'package:flutter/material.dart';
import 'package:hungry_app/home_screen.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    HomeScreen.routeName: (context) => HomeScreen(),
  };
}
