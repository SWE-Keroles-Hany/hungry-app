import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/theme/app_theme.dart';

class CustomSlider extends StatelessWidget {
  final Function(double)? onChanged;
  final double value;
  const CustomSlider({super.key, required this.onChanged, required this.value});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Spicy",
          style: textTheme.labelMedium!.copyWith(
            fontWeight: FontWeight.w800,
            color: AppTheme.primaryColor,
          ),
        ),
        Slider(
          thumbColor: AppTheme.primaryColor,
          allowedInteraction: SliderInteraction.tapAndSlide,
          activeColor: AppTheme.primaryColor,
          max: 1.0,
          min: 0.0,
          padding: EdgeInsets.all(4.r),
          value: value,
          onChanged: onChanged,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("🥶", style: textTheme.labelSmall),
            Text("🌶️", style: textTheme.labelSmall),
          ],
        ),
      ],
    );
  }
}
