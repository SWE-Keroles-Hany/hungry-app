import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/routes/app_routes.dart';
import 'package:hungry_app/core/theme/app_theme.dart';
import 'package:hungry_app/home_screen.dart';
import 'package:hungry_app/splash_screen.dart';

void main() {
  runApp(const HungryApp());
}

class HungryApp extends StatelessWidget {
  const HungryApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
        theme: AppTheme.theme,
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.routeName,
        routes: AppRoutes.routes,
      ),
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(430, 932),
    );
  }
}
