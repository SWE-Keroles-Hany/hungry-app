import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.onPressed,
    super.key,
    required this.title,
    required this.titleColor,
    required this.bgColor,
    this.radiusNumber = 8.0,
    required this.width,
  });
  final void Function()? onPressed;
  final String title;
  final Color bgColor;
  final Color titleColor;
  final double radiusNumber;
  final double width;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width, 55.h),
        // padding: EdgeInsets.all(8.r),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(radiusNumber.r),
        ),
        backgroundColor: bgColor,
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: textTheme.labelMedium!.copyWith(color: titleColor),
      ),
    );
  }
}
