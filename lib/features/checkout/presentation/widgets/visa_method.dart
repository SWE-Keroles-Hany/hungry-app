import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/theme/app_theme.dart';

class VisaMethod extends StatelessWidget {
  final bool isSelected;
  const VisaMethod({super.key, required this.isSelected});
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = TextTheme.of(context);
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppTheme.black.withAlpha(
              (0.15 * 255).toInt(),
            ), // 0.15 opacity
            spreadRadius: 1,
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
          BoxShadow(
            color: AppTheme.black.withAlpha(
              (0.05 * 255).toInt(),
            ), // 0.05 opacity
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
        color: isSelected ? AppTheme.darkBrown : AppTheme.lightGray,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          SizedBox(width: 10.w),
          Image.asset("assets/icons/visa.png", width: 75.w),
          SizedBox(width: 20.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Depit card",
                style: textTheme.labelMedium!.copyWith(
                  color: isSelected ? AppTheme.white : AppTheme.darkBrown,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                "**** **** **** ****",
                style: textTheme.labelMedium!.copyWith(),
              ),
            ],
          ),
          Spacer(),
          Image.asset(
            isSelected
                ? "assets/icons/circle_on.png"
                : "assets/icons/circle_off.png",
            width: 50.w,
          ),
        ],
      ),
    );
  }
}
