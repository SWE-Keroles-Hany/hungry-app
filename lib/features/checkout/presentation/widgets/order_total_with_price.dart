import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/theme/app_theme.dart';

class OrderTotalWithPrice extends StatelessWidget {
  const OrderTotalWithPrice({super.key, required this.price});
  final double price;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Total :",
            style: textTheme.labelLarge!.copyWith(
              color: AppTheme.darkBrown,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "\$$price",
            style: textTheme.labelLarge!.copyWith(
              fontFamily: "Reem Kufi Ink",
              color: AppTheme.darkBrown,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
