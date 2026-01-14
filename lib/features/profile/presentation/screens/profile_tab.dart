import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/constants/text_constants.dart';
import 'package:hungry_app/core/helper/app_helper.dart';
import 'package:hungry_app/core/theme/app_theme.dart';
import 'package:hungry_app/core/utils/ui_utils.dart';
import 'package:hungry_app/core/widgets/custom_loading_shimmer.dart';

import 'package:hungry_app/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:hungry_app/features/profile/presentation/cubit/profile_states.dart';
import 'package:hungry_app/features/profile/presentation/widgets/edit_profile_button.dart';
import 'package:hungry_app/features/profile/presentation/widgets/profile_row_info.dart';
import 'package:hungry_app/features/profile/presentation/widgets/profile_picture.dart';
import 'package:image_picker/image_picker.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  File? file;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppTheme.primaryColor,
        body: Padding(
          padding: EdgeInsets.all(20.r),
          child: BlocConsumer<ProfileCubit, ProfileStates>(
            listenWhen: (previous, current) {
              return current is LoadingUpdateProfileState ||
                  current is SuccessUpdateProfileState ||
                  current is ErrorUpdateProfileState;
            },
            buildWhen: (previous, current) {
              return current is SuccessGetProfileState;
            },
            listener: (context, state) {
              if (state is SuccessUpdateProfileState) {
                Navigator.of(context).pop();
                context.read<ProfileCubit>().getProfile();
              } else if (state is ErrorUpdateProfileState) {
                Navigator.of(context).pop();
                UiUtils.showMessage(
                  message: state.message,
                  isErrorMessage: true,
                );
                context.read<ProfileCubit>().getProfile();
              } else if (state is LoadingUpdateProfileState) {
                Navigator.of(context).pop();
                UiUtils.showLoadingIndicator(context);
              }
            },
            builder: (context, state) {
              if (state is ErrorGetProfileState) {
                return Center(child: Text(state.message));
              } else if (state is LoadingGetProfileState) {
                return CustomLoadingShimmer(children: GetProfileInfo());
              } else if (state is SuccessGetProfileState) {
                final user = state.profile;

                return Column(
                  children: [
                    SizedBox(height: 35.h),

                    //! Image
                    GestureDetector(
                      onTap: pickImage,
                      child: ProfilePicture(file: file),
                    ),
                    SizedBox(height: 35.h),

                    //! Name
                    ProfileRowInfo(
                      label: TextConstants.name,
                      value: user.name ?? "",
                    ),
                    SizedBox(height: 35.h),

                    //! Email
                    ProfileRowInfo(
                      label: TextConstants.emailAddress,
                      value: user.email ?? "",
                    ),
                    SizedBox(height: 35.h),

                    //! Address
                    ProfileRowInfo(
                      label: TextConstants.address,
                      value: user.address ?? "No Address",
                    ),
                    SizedBox(height: 30.h),
                  ],
                );
              }
              return const SizedBox();
            },
          ),
        ),
        bottomSheet: Container(
          padding: EdgeInsets.all(10.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [LogOut()],
          ),
        ),
      ),
    );
  }

  pickImage() async {
    final picker = ImagePicker();

    final xfile = await picker.pickImage(source: ImageSource.gallery);
    if (xfile == null) return;

    setState(() {
      file = File(xfile.path);
    });

    //! server return redirect webstie
    // await context.read<ProfileCubit>().updateProfile(
    //   profile: ProfileEntity(imageFile: file),
    // );
  }
}
