import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/theme/app_theme.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.textTheme,
    required this.description,
    required this.rate,
    required this.imgURL,

    required this.title,
  });
  final String title;
  final String description;
  final int rate;
  final TextTheme textTheme;
  final String imgURL;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.r, horizontal: 10.r),
      width: width * 0.45,
      // height: 500,
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
        borderRadius: BorderRadius.circular(20.r),
        color: AppTheme.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imgURL),
          SizedBox(height: 5.h),
          Text(
            title,
            style: textTheme.labelSmall!.copyWith(color: AppTheme.darkBrown),
          ),
          Text(
            description,
            style: textTheme.labelSmall!.copyWith(
              color: AppTheme.darkBrown,
              fontWeight: FontWeight.w500,
            ),
          ),
          // Spacer(),
          SizedBox(height: 5.h),

          Row(
            children: [
              Icon(Icons.star, color: Colors.orange),
              SizedBox(width: 2.w),
              Text(
                "$rate",
                style: textTheme.labelSmall!.copyWith(
                  color: AppTheme.darkBrown,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
