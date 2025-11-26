import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/theme/app_theme.dart';

class WelcomeMessage extends StatelessWidget {
  const WelcomeMessage({required this.name, super.key});
  final String name;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Text(
      "Hello, $name",
      style: textTheme.labelSmall!.copyWith(
        fontSize: 18.sp,
        color: AppTheme.mediumGray,
      ),
    );
  }
}
