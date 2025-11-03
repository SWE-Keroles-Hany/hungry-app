import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/theme/app_theme.dart';

class CustomInputField extends StatefulWidget {
  const CustomInputField({
    super.key,
    required this.textTheme,
    this.isPasswordField = false,
    required this.title,
    required this.controller,
    required this.validator,
  });
  final TextEditingController controller;
  final bool isPasswordField;
  final String title;
  final TextTheme textTheme;
  final String? Function(String?)? validator;

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validator,
      controller: widget.controller,
      obscureText: showPassword,
      decoration: InputDecoration(
        errorStyle: textTheme.labelMedium!.copyWith(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: AppTheme.yellow,
        ),
        suffixIcon: widget.isPasswordField
            ? IconButton(
                icon: Icon(
                  showPassword ? Icons.visibility_off : Icons.visibility,
                  color: AppTheme.red,
                ),
                onPressed: () {
                  setState(() {
                    showPassword = !showPassword;
                  });
                },
              )
            : null,
        hint: Text(widget.title, style: widget.textTheme.labelMedium),
        filled: true,
        fillColor: AppTheme.white,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
    );
  }
}
