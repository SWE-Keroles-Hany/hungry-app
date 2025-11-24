import 'package:flutter/material.dart';
import 'package:hungry_app/core/theme/app_theme.dart';
import 'package:hungry_app/features/auth/presentation/widgets/custom_button.dart';
import 'package:hungry_app/features/products/presentation/widgets/total_price.dart';

class TotalPriceWithAction extends StatelessWidget {
  const TotalPriceWithAction({
    super.key,
    required this.onPressed,
    required this.totalPrice,
    required this.width,

    required this.title,
  });
  final Function()? onPressed;
  final String title;
  final double totalPrice;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TotalPrice(totalPrice: totalPrice),
        Spacer(),
        CustomButton(
          width: width,
          radiusNumber: 20,
          bgColor: AppTheme.primaryColor,
          titleColor: AppTheme.white,
          onPressed: onPressed,
          title: title,
        ),
      ],
    );
  }
}
