import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/theme/app_theme.dart';

class OrderTime extends StatelessWidget {
  const OrderTime({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = TextTheme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Estimated delivery time:",
            style: textTheme.labelMedium!.copyWith(
              color: AppTheme.darkBrown,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "15 - 30 mins",
            style: textTheme.labelMedium!.copyWith(
              color: AppTheme.darkBrown,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
