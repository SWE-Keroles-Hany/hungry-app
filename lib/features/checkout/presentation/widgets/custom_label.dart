import 'package:flutter/material.dart';
import 'package:hungry_app/core/theme/app_theme.dart';

class CustomLabel extends StatelessWidget {
  const CustomLabel({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Text(
      title,
      style: textTheme.labelLarge!.copyWith(color: AppTheme.darkBrown),
    );
  }
}
