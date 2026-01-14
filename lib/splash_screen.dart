import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hungry_app/core/constants/image_constants.dart';
import 'package:hungry_app/core/theme/app_theme.dart';
import 'package:hungry_app/core/utils/ui_utils.dart';
import 'package:hungry_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:hungry_app/features/auth/presentation/cubit/auth_states.dart';
import 'package:hungry_app/features/auth/presentation/screens/login_screen.dart';
import 'package:hungry_app/features/home/presentation/screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "SplashScreen";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.primaryColor,
        body: BlocListener<AuthCubit, AuthStates>(
          listener: (context, state) {
            if (state is IsLoggedInErrorState) {
              Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
            } else if (state is IsLoggedInSuccessState) {
              Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
            } else if (state is IsLoggedInLoadingState) {
              UiUtils.showLoadingIndicator(context);
            }
          },
          child: Column(
            children: [
              SizedBox(height: size.height * 0.25),
              SvgPicture.asset(ImageConstants.logo),
              Spacer(),
              Image.asset(ImageConstants.product),
            ],
          ),
        ),
      ),
    );
  }
}
