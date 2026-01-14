import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/constants/text_constants.dart';
import 'package:hungry_app/core/theme/app_theme.dart';
import 'package:hungry_app/features/auth/presentation/widgets/custom_button.dart';
import 'package:hungry_app/features/profile/domain/entities/profile_entity.dart';
import 'package:hungry_app/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:hungry_app/features/profile/presentation/widgets/edit_row_info_field.dart';

Future editProfileRowInfo(
  BuildContext context,
  TextEditingController controller,
  String label,
) {
  return showDialog(
    context: context,
    builder: (context) {
      return PopScope(
        child: AlertDialog(
          backgroundColor: AppTheme.darkBrown,
          content: PopScope(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(height: 10.h),
                EditRowInfoField(controller: controller, lable: label),
                SizedBox(height: 25.h),
                CustomButton(
                  radiusNumber: 20.r,
                  onPressed: onSave(context, controller, label),
                  title: TextConstants.save,
                  titleColor: AppTheme.white,
                  bgColor: AppTheme.primaryColor,
                  width: 200.w,
                ),
                SizedBox(height: 25.h),
              ],
            ),
          ),
        ),
      );
    },
  );
}

onSave(
  BuildContext context,
  TextEditingController controller,
  String label,
) async {
  final value = controller.text;
  ProfileEntity profile = ProfileEntity();
  if (label == TextConstants.name) {
    profile.name = value;
  } else if (label == TextConstants.phone) {
    profile.phone = value;
  } else if (label == TextConstants.address) {
    profile.address = value;
  } else if (label == "Email") {
    profile.email = value;
  }
  await context.read<ProfileCubit>().updateProfile(profile: profile);
}
