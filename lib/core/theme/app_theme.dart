import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static const primaryColor = Color(0xff08431D);
  static const white = Colors.white;
  static const black = Colors.black;
  static const red = Colors.red;

  static const darkBrown = Color(0xff3C2F2F);
  static const Color mediumGray = Color(0xFF6A6A6A);
  static const Color lightGray = Color(0xFFF3F4F6);
  static const Color yellow = Colors.yellow;

  static ThemeData theme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,

      backgroundColor: Colors.transparent,
    ),
    textTheme: TextTheme(
      labelSmall: TextStyle(
        color: white,
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
      ),
      labelMedium: TextStyle(
        color: mediumGray,
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
      ),
    ),

    scaffoldBackgroundColor: white,
  );
}
