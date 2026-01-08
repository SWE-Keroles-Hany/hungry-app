import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/constants/app_constants.dart';
import 'package:hungry_app/core/helper/app_helper.dart';
import 'package:hungry_app/core/service_locator/get_it.dart';
import 'package:hungry_app/core/theme/app_theme.dart';
import 'package:hungry_app/core/utils/ui_utils.dart';
import 'package:hungry_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:hungry_app/features/auth/presentation/cubit/auth_states.dart';
import 'package:hungry_app/features/auth/presentation/screens/login_screen.dart';
import 'package:hungry_app/features/home/presentation/widgets/product_list.dart';
import 'package:hungry_app/features/profile/domain/entities/profile_entity.dart';
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
  File? file; // ✅ اتحطت هنا

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              UiUtils.showMessage(message: state.message, isErrorMessage: true);
              context.read<ProfileCubit>().getProfile();
            } else if (state is LoadingUpdateProfileState) {
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
                    label: AppConstants.name,
                    value: user.name ?? "",
                  ),
                  SizedBox(height: 35.h),

                  //! Email
                  ProfileRowInfo(
                    label: AppConstants.email,
                    value: user.email ?? "",
                  ),
                  SizedBox(height: 35.h),

                  //! Address
                  ProfileRowInfo(
                    label: AppConstants.address,
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
      bottomSheet: BlocListener<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is LogOutSuccessState) {
            Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
          } else if (state is LogOutErrorState) {
            UiUtils.showMessage(message: state.message);
          }
        },
        child: Container(
          padding: EdgeInsets.all(10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () async {
                  await context.read<AuthCubit>().logout();
                },
                child: LogOut(),
              ),
            ],
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
