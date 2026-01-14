import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/helper/app_helper.dart';
import 'package:hungry_app/core/theme/app_theme.dart';

import 'package:hungry_app/features/profile/presentation/widgets/edit_profile_row_info.dart';

class ProfileRowInfo extends StatefulWidget {
  const ProfileRowInfo({super.key, required this.label, required this.value});
  final String label;
  final String value;

  @override
  State<ProfileRowInfo> createState() => _ProfileRowInfoState();
}

class _ProfileRowInfoState extends State<ProfileRowInfo> {
  final TextEditingController controller = TextEditingController();
  @override
  void initState() {
    controller.text = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      child: TextField(
        style: textTheme.labelMedium!.copyWith(color: AppTheme.white),
        controller: controller,
        autofocus: true,
        readOnly: true,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () =>
                editProfileRowInfo(context, controller, widget.label),
            icon: Icon(Icons.edit_outlined, color: AppTheme.white),
          ),
          contentPadding: EdgeInsets.only(left: 20.w, top: 40.h),
          hintStyle: textTheme.labelMedium!.copyWith(color: AppTheme.white),
          labelText: widget.label.toString(),
          labelStyle: textTheme.labelMedium!.copyWith(color: AppTheme.white),
          focusedBorder: getBorder(),
          enabled: true,
          enabledBorder: getBorder(),
          border: getBorder(),
        ),
      ),
    );
  }
}
