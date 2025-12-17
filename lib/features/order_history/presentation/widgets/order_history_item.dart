import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/theme/app_theme.dart';

class OrderHistoryItem extends StatelessWidget {
  const OrderHistoryItem({
    super.key,
    required this.imgURL,
    required this.title,

    required this.quantity,
    required this.price,
    required this.onPressed,
  });
  final String imgURL;
  final String title;
  final int quantity;
  final String price;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.lightGray,
        // color: Colors.teal,
        boxShadow: [
          // Top
          BoxShadow(
            color: Colors.black12, // أو Colors.grey.withOpacity(0.15)
            blurRadius: 0,
            spreadRadius: 0,
            offset: Offset(0, -1),
          ),
          // Bottom
          BoxShadow(
            color: Colors.black12,
            blurRadius: 0,
            spreadRadius: 0,
            offset: Offset(0, 1),
          ),
          // Left
          BoxShadow(
            color: Colors.black12,
            blurRadius: 0,
            spreadRadius: 0,
            offset: Offset(-1, 0),
          ),
          // Right
          BoxShadow(
            color: Colors.black12,
            blurRadius: 0,
            spreadRadius: 0,
            offset: Offset(1, 0),
          ),
        ],
        borderRadius: BorderRadius.circular(16.r),
      ),
      padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CachedNetworkImage(imageUrl: imgURL, width: 100.w),

              // Image.asset(imgURL, width: 100.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   title,
                  //   style: textTheme.labelMedium!.copyWith(
                  //     color: AppTheme.black,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  Row(
                    children: [
                      Text(
                        "Quntity : ",
                        style: textTheme.labelMedium!.copyWith(
                          color: AppTheme.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        "$quantity",
                        style: textTheme.labelMedium!.copyWith(
                          color: AppTheme.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Price : ",
                        style: textTheme.labelMedium!.copyWith(
                          color: AppTheme.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        "$price\$",
                        style: textTheme.labelMedium!.copyWith(
                          color: AppTheme.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          // SizedBox(height: 25.h),
          // CustomButton(
          //   onPressed: onPressed,
          //   title: "Order Again",
          //   titleColor: AppTheme.white,
          //   bgColor: const Color.fromARGB(255, 161, 161, 161),
          //   width: double.infinity,
          // ),
        ],
      ),
    );
  }
}
