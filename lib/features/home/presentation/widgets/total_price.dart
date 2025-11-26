import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/theme/app_theme.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({super.key, required this.totalPrice});
  final double totalPrice;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Total",
          style: textTheme.labelMedium!.copyWith(color: AppTheme.darkBrown),
        ),
        Text(
          "\$$totalPrice",
          style: textTheme.labelLarge!.copyWith(
            fontSize: 32.sp,
            color: AppTheme.darkBrown,
          ),
        ),
      ],
    );
  }
}
