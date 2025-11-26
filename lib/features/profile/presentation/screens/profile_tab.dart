import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/theme/app_theme.dart';
import 'package:hungry_app/features/checkout/presentation/widgets/custom_divider.dart';
import 'package:hungry_app/features/checkout/presentation/widgets/visa_method.dart';
import 'package:hungry_app/features/profile/presentation/widgets/edit_profile_button.dart';
import 'package:hungry_app/features/profile/presentation/widgets/logout_button.dart';
import 'package:hungry_app/features/profile/presentation/widgets/profile_info.dart';
import 'package:hungry_app/features/profile/presentation/widgets/profile_picture.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  final TextEditingController nameController = TextEditingController(
    text: "Keroles",
  );

  final TextEditingController emailController = TextEditingController(
    text: "keroles@gmdail.com",
  );

  final TextEditingController addressController = TextEditingController(
    text: "aassiut",
  );

  final TextEditingController passwordController = TextEditingController(
    text: "0123221s1",
  );

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      body: Padding(
        padding: EdgeInsets.all(20.r),
        child: Column(
          children: [
            ProfilePicture(imgURL: "assets/images/profile.jpg"),
            SizedBox(height: 25.h),
            ProfileInfo(label: "Name", controller: nameController),
            SizedBox(height: 25.h),
            ProfileInfo(label: "Email", controller: emailController),
            SizedBox(height: 25.h),
            ProfileInfo(
              label: "Delivery address",
              controller: addressController,
            ),
            SizedBox(height: 25.h),
            ProfileInfo(
              label: "Password",
              controller: passwordController,
              isPasswordField: true,
            ),
            SizedBox(height: 15.h),
            CustomDivider(color: AppTheme.lightGray),
            // SizedBox(height: 25.h),
            VisaMethod(isSelected: true),
            // SizedBox(height: 25.h),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.all(10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(onTap: () {}, child: EditProfileButton()),
            GestureDetector(onTap: () {}, child: LogoutButton()),
          ],
        ),
      ),
    );
  }
}
