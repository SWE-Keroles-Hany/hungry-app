import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hungry_app/core/check_internet/internet_cubit.dart';
import 'package:hungry_app/core/constants/image_constants.dart';
import 'package:hungry_app/core/constants/text_constants.dart';
import 'package:hungry_app/core/theme/app_theme.dart';
import 'package:hungry_app/core/utils/ui_utils.dart';
import 'package:hungry_app/core/validation/app_validator.dart';
import 'package:hungry_app/features/auth/domain/entities/login_entity.dart';
import 'package:hungry_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:hungry_app/features/auth/presentation/cubit/auth_states.dart';
import 'package:hungry_app/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:hungry_app/features/auth/presentation/widgets/custom_button.dart';
import 'package:hungry_app/features/auth/presentation/widgets/custom_input_field.dart';
import 'package:hungry_app/features/home/presentation/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "LoginScreen";
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    context.read<InternetCubit>().checkInternet();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.sizeOf(context);
    return SafeArea(
      //! Auth States
      child: BlocListener<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is LoginErrorState) {
            UiUtils.hideLoading(context);
            UiUtils.showMessage(message: state.message, isErrorMessage: true);
          } else if (state is LoginLoadingState) {
            UiUtils.showLoadingIndicator(context);
          }
          if (state is LoginSuccessState) {
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: size.height * 0.1),
                    //! Logo
                    SvgPicture.asset(ImageConstants.logo),
                    SizedBox(height: 10.h),

                    //! E-mail
                    Text(
                      textAlign: TextAlign.center,
                      TextConstants.descritption,
                      style: textTheme.labelSmall,
                    ),
                    SizedBox(height: size.height * 0.1),
                    CustomInputField(
                      validator: (value) => AppValidator.emailValidator(value),
                      controller: emailController,
                      title: TextConstants.emailAddress,
                      textTheme: textTheme,
                    ),

                    //! Password
                    SizedBox(height: 30.h),
                    CustomInputField(
                      validator: (value) =>
                          AppValidator.passwordValidator(value: value),
                      controller: passwordController,
                      isPasswordField: true,
                      title: TextConstants.password,
                      textTheme: textTheme,
                    ),
                    SizedBox(height: 30.h),

                    //! Login Button
                    CustomButton(
                      width: size.width * 0.8,
                      bgColor: AppTheme.white,
                      titleColor: AppTheme.black,
                      title: TextConstants.login,
                      onPressed: () => onLogin(context),
                    ),

                    //! If Don't Have an Account !?
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          TextConstants.donNotHaveAccount,
                          style: textTheme.labelMedium!.copyWith(
                            color: AppTheme.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),

                        TextButton(
                          onPressed: () => Navigator.of(
                            context,
                          ).pushReplacementNamed(SignUpScreen.routeName),
                          child: Text(
                            TextConstants.signUp,
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

  onLogin(BuildContext context) async {
    if (_globalKey.currentState!.validate()) {
      await BlocProvider.of<AuthCubit>(context).login(
        loginEntity: LoginEntity(emailController.text, passwordController.text),
      );
    }
  }
}
