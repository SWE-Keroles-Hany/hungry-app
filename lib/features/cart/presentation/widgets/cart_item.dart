import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/theme/app_theme.dart';
import 'package:hungry_app/features/auth/presentation/widgets/custom_button.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final height = MediaQuery.sizeOf(context).height;
    return Container(
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
                Image.asset("assets/images/image.png", width: 110),
                SizedBox(height: 8.h),
                Text(
                  "Hamburger",
                  style: textTheme.labelMedium!.copyWith(
                    color: AppTheme.darkBrown,
                  ),
                ),
                Text(
                  "Veggie Burger",
                  style: textTheme.labelMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppTheme.darkBrown,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset("assets/images/minus_icon.png"),
                    ),
                    Text(
                      "1",
                      style: textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppTheme.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset("assets/images/plus_icon.png"),
                    ),
                  ],
                ),
                SizedBox(height: 25.h),
                CustomButton(
                  width: 155,
                  radiusNumber: 30,
                  onPressed: () {},
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
