import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/constants/app_constants.dart';
import 'package:hungry_app/core/helper/app_helper.dart';
import 'package:hungry_app/core/theme/app_theme.dart';
import 'package:hungry_app/core/utils/ui_utils.dart';
import 'package:hungry_app/features/auth/presentation/widgets/custom_button.dart';
import 'package:hungry_app/features/profile/domain/entities/profile_entity.dart';
import 'package:hungry_app/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:hungry_app/features/profile/presentation/cubit/profile_states.dart';
import 'package:hungry_app/features/profile/presentation/widgets/edit_row_info_field.dart';

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

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return TextField(
      style: textTheme.labelMedium!.copyWith(color: AppTheme.white),
      controller: controller,
      autofocus: true,
      readOnly: true,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: editProfileRowInfo,
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
    );
  }

  Future editProfileRowInfo() {
    return showDialog(
      context: context,
      builder: (context) {
        return PopScope(
          child: AlertDialog(
            backgroundColor: AppTheme.darkBrown,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(height: 10.h),
                EditRowInfoField(controller: controller, lable: widget.label),
                SizedBox(height: 25.h),
                CustomButton(
                  radiusNumber: 20.r,
                  onPressed: () async {
                    final label = widget.label;
                    final value = controller.text;
                    log(value);
                    ProfileEntity profile = ProfileEntity();
                    if (label == AppConstants.name) {
                      profile.name = value;
                    } else if (label == AppConstants.phone) {
                      profile.phone = value;
                    } else if (label == AppConstants.address) {
                      profile.address = value;
                    } else if (label == AppConstants.email) {
                      profile.email = value;
                    }
                    await context.read<ProfileCubit>().updateProfile(
                      profile: profile,
                    );
                  },
                  title: "Save",
                  titleColor: AppTheme.white,
                  bgColor: AppTheme.primaryColor,
                  width: 200.w,
                ),
                SizedBox(height: 25.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
