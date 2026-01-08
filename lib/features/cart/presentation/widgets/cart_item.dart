import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/theme/app_theme.dart';
import 'package:hungry_app/features/auth/presentation/widgets/custom_button.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.price,

    required this.onRemove,
    required this.name,
    required this.imgURL,
    required this.quntity,
  });
  final String name;
  final String imgURL;
  final int quntity;
  final void Function()? onRemove;
  final String price;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.all(8.r),
      padding: EdgeInsets.all(30.r),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(imageUrl: imgURL, width: 100.w),
                SizedBox(height: 8.h),
                Text(
                  name,
                  style: textTheme.labelSmall!.copyWith(
                    color: AppTheme.darkBrown,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //     ),
                Text(
                  "Quntity: $quntity",
                  style: textTheme.labelMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppTheme.black,
                  ),
                ),
                Text(
                  "Price: $price \$",
                  style: textTheme.labelMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppTheme.black,
                  ),
                ),

                SizedBox(height: 25.h),
                CustomButton(
                  width: 155,
                  radiusNumber: 30,
                  onPressed: onRemove,
                  title: "Remove",
                  titleColor: AppTheme.white,
                  bgColor: AppTheme.primaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
