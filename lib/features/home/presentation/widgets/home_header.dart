import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key, required this.imgURL});
  final String imgURL;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset("assets/icons/green_logo.svg"),
        Spacer(),
        ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(16.r),
          child: Image.asset(imgURL, width: 100.w),
        ),
      ],
    );
  }
}
