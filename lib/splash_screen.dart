import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hungry_app/core/theme/app_theme.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "SplashScreen";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.primaryColor,
        body: Column(
          children: [
            SizedBox(height: size.height * 0.3),
            SvgPicture.asset("assets/images/logo.svg"),
            Spacer(),
            Image.asset("assets/images/image.png"),
          ],
        ),
      ),
    );
  }
}
