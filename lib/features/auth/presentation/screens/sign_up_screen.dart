import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hungry_app/core/theme/app_theme.dart';
import 'package:hungry_app/core/utils/ui_utils.dart';
import 'package:hungry_app/core/validation/app_validator.dart';
import 'package:hungry_app/features/auth/domain/entities/sign_up_entity.dart';
import 'package:hungry_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:hungry_app/features/auth/presentation/cubit/auth_states.dart';
import 'package:hungry_app/features/auth/presentation/screens/login_screen.dart';
import 'package:hungry_app/features/auth/presentation/widgets/custom_button.dart';
import 'package:hungry_app/features/auth/presentation/widgets/custom_input_field.dart';
import 'package:hungry_app/features/home/presentation/screens/home_screen.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = "SignUpScreen";
  SignUpScreen({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.sizeOf(context);

    return SafeArea(
      child: BlocListener<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is SignUpErrorState) {
            UiUtils.hideLoading(context);
            UiUtils.showMessage(message: state.message, isErrorMessage: true);
          } else if (state is SignUpLoadingState) {
            UiUtils.showLoadingIndicator(context);
          }
          if (state is SignUpSuccessState) {
            UiUtils.hideLoading(context);
            Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: AppTheme.primaryColor,
          body: Padding(
            padding: EdgeInsets.all(20.r),
            child: Form(
              key: _globalKey,
              child: SingleChildScrollView(
                reverse: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: size.height * 0.1),
                    SvgPicture.asset("assets/icons/logo.svg"),
                    SizedBox(height: size.height * 0.1),
                    CustomInputField(
                      validator: (value) => AppValidator.nameValidator(value),
                      controller: nameController,
                      title: "Name",
                      textTheme: textTheme,
                    ),
                    SizedBox(height: 16.h),
                    CustomInputField(
                      validator: (value) => AppValidator.emailValidator(value),
                      controller: emailController,
                      title: "Email Address",
                      textTheme: textTheme,
                    ),
                    SizedBox(height: 16.h),
                    CustomInputField(
                      isPasswordField: true,
                      validator: (value) =>
                          AppValidator.passwordValidator(value: value),
                      controller: passwordController,
                      title: "Password",
                      textTheme: textTheme,
                    ),
                    SizedBox(height: 16.h),
                    CustomInputField(
                      isPasswordField: true,
                      validator: (value) =>
                          AppValidator.confirmPasswordValidator(
                            password: passwordController.text,
                            value: confirmPasswordController.text,
                          ),
                      controller: confirmPasswordController,
                      title: "Confirm Password",
                      textTheme: textTheme,
                    ),
                    SizedBox(height: 30.h),
                    CustomButton(
                      width: size.width * 0.8,
                      bgColor: AppTheme.white,
                      titleColor: AppTheme.black,
                      title: "Sign up",
                      onPressed: () async {
                        if (_globalKey.currentState!.validate()) {
                          await BlocProvider.of<AuthCubit>(context).signUp(
                            signUpEntity: SignUpEntity(
                              emailController.text,
                              passwordController.text,
                              nameController.text,
                            ),
                          );
                        }
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Have an Account ?",
                          style: textTheme.labelMedium!.copyWith(
                            color: AppTheme.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),

                        TextButton(
                          onPressed: () {
                            Navigator.of(
                              context,
                            ).pushReplacementNamed(LoginScreen.routeName);
                          },
                          child: Text(
                            "Login",
                            style: textTheme.labelMedium!.copyWith(
                              color: AppTheme.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
