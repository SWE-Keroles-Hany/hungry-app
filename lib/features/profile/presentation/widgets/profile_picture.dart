import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/theme/app_theme.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({required this.imgURL, super.key});
  final String imgURL;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      height: 150.h,
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(imgURL)),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppTheme.white, width: 8.w),
      ),
    );
  }
}
