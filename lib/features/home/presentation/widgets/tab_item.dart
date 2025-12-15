import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabItem extends StatelessWidget {
  const TabItem({
    super.key,
    required this.title,
    this.bgColor,
    this.titleColor,
  });
  final String title;
  final Color? bgColor;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: 45.h,
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      margin: EdgeInsets.all(4.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: bgColor,
      ),
      child: Center(
        child: Text(
          title,
          style: textTheme.labelSmall!.copyWith(color: titleColor),
        ),
      ),
    );
  }
}
