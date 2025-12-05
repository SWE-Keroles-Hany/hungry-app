import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static const primaryColor = Color(0xff08431D);
  static const white = Colors.white;
  static const black = Colors.black;
  static const yellow = Colors.yellow;

  static const red = Colors.red;
  static const darkBrown = Color(0xff3C2F2F);
  static const Color mediumGray = Color(0xFF6A6A6A);
  static const Color lightGray = Color(0xFFF3F4F6);
  static const Color grayF0 = Color.fromARGB(255, 226, 219, 219);
  static ThemeData theme = ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: white),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,

      backgroundColor: Colors.transparent,
    ),
    sliderTheme: SliderThemeData(
      trackHeight: 10.h,

      // overlayShape: SliderComponentShape.noThumb,
      valueIndicatorColor: black,
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
      labelLarge: TextStyle(
        color: mediumGray,
        fontSize: 25.sp,
        fontWeight: FontWeight.bold,
      ),
    ),

    scaffoldBackgroundColor: white,
  );
}
