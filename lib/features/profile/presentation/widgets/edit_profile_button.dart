import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/theme/app_theme.dart';
import 'package:hungry_app/core/utils/ui_utils.dart';
import 'package:hungry_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:hungry_app/features/auth/presentation/cubit/auth_states.dart';
import 'package:hungry_app/features/auth/presentation/screens/login_screen.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LogOut extends StatelessWidget {
  const LogOut({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await context.read<AuthCubit>().logout();
      },
      child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is LogOutSuccessState) {
            Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
          } else if (state is LogOutErrorState) {
            UiUtils.showMessage(message: state.message);
          }
        },
        builder: (context, state) {
          if (state is LogOutLoadingState) {
            return Stack(
              alignment: AlignmentGeometry.center,
              children: [
                LogoutButton(),
                LoadingAnimationWidget.dotsTriangle(
                  color: AppTheme.yellow,
                  size: 25,
                ),

                // CircularProgressIndicator(color: AppTheme.yellow),
              ],
            );
          }
          return LogoutButton();
        },
      ),
    );
  }
}

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      decoration: BoxDecoration(
        color: AppTheme.primaryColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(width: 20.w),
          Text(
            "Log Out",
            style: textTheme.labelMedium!.copyWith(
              color: AppTheme.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 20.w),
          Icon(Icons.logout, color: AppTheme.white, size: 30.r),
          SizedBox(width: 10.w),
        ],
      ),
    );
  }
}
