import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/theme/app_theme.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({
    super.key,
    required this.label,
    required this.controller,

    this.isPasswordField = false,
  });
  final String label;
  final bool isPasswordField;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return TextField(
      style: textTheme.labelMedium!.copyWith(color: AppTheme.white),
      controller: controller,
      obscureText: isPasswordField,
      // canRequestFocus: true,
      autofocus: true,
      readOnly: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 20.w, top: 40.h),
        hintStyle: textTheme.labelMedium!.copyWith(color: AppTheme.white),
        labelText: label,
        labelStyle: textTheme.labelMedium!.copyWith(color: AppTheme.white),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2.5.w, color: AppTheme.white),
          borderRadius: BorderRadius.circular(18.r),
        ),
        enabled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2.5.w, color: AppTheme.white),
          borderRadius: BorderRadius.circular(18.r),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 2.5.w, color: AppTheme.white),

          borderRadius: BorderRadius.circular(18.r),
        ),
      ),
    );
  }
}
