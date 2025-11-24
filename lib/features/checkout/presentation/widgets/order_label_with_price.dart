import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderLabelWithPrice extends StatelessWidget {
  const OrderLabelWithPrice({
    super.key,
    required this.price,
    required this.title,
  });
  final String title;
  final double price;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: textTheme.labelMedium!.copyWith(fontSize: 18.r)),
          Text(
            "\$$price",

            style: textTheme.labelMedium!.copyWith(
              fontSize: 18.r,
              fontFamily: "Reem Kufi Ink",
            ),
          ),
        ],
      ),
    );
  }
}
