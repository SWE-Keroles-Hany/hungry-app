import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/theme/app_theme.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({required this.file, super.key});
  final File? file;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      height: 150.h,
      child: file != null
          ? Image.file(fit: BoxFit.fill, file!)
          : Image.asset(fit: BoxFit.fill, "assets/images/profile.jpg"),
      decoration: BoxDecoration(
        // image: DecorationImage(image: NetworkImage(imgURL)),
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppTheme.white, width: 8.w),
      ),
    );
  }
}
