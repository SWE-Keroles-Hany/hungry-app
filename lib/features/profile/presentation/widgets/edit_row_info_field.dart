import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/helper/app_helper.dart';
import 'package:hungry_app/core/theme/app_theme.dart';

class EditRowInfoField extends StatefulWidget {
  const EditRowInfoField({
    super.key,
    required this.lable,
    required this.controller,
  });
  final String lable;
  // final String value;

  final TextEditingController controller;
  @override
  State<EditRowInfoField> createState() => _EditRowInfoFieldState();
}

class _EditRowInfoFieldState extends State<EditRowInfoField> {
  @override
  Widget build(BuildContext context) {
    log(widget.controller.text);
    final textTheme = Theme.of(context).textTheme;
    return TextField(
      style: textTheme.labelMedium!.copyWith(color: AppTheme.white),
      controller: widget.controller,
      autofocus: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 20.w, top: 40.h),
        hintStyle: textTheme.labelMedium!.copyWith(color: AppTheme.white),
        labelText: widget.lable.toString(),
        labelStyle: textTheme.labelMedium!.copyWith(color: AppTheme.white),
        focusedBorder: getBorder(),
        enabled: true,
        enabledBorder: getBorder(),
        border: getBorder(),
      ),
    );
  }
}
