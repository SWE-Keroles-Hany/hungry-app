import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/routes/app_routes.dart';
import 'package:hungry_app/core/theme/app_theme.dart';
import 'package:hungry_app/features/auth/presentation/screens/login_screen.dart';
import 'package:hungry_app/home_screen.dart';

void main() {
  runApp(const HungryApp());
}

class HungryApp extends StatelessWidget {
  const HungryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
        theme: AppTheme.theme,
        debugShowCheckedModeBanner: false,
        initialRoute: HomeScreen.routeName,
        routes: AppRoutes.routes,
      ),
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(430, 932),
    );
  }
}
