import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/theme/app_theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.onPressed,
    super.key,
    required this.textTheme,
    required this.title,
  });
  final void Function()? onPressed;
  final TextTheme textTheme;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(double.infinity, 60.h),
        // padding: EdgeInsets.all(8.r),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(8.r),
        ),
        backgroundColor: AppTheme.white,
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: textTheme.labelMedium!.copyWith(color: AppTheme.black),
      ),
    );
  }
}
