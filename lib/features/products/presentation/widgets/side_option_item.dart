import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/theme/app_theme.dart';

class SideOptionItem extends StatelessWidget {
  const SideOptionItem({required this.addIcon, super.key});
  final String addIcon;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final width = MediaQuery.sizeOf(context).width;
    return Stack(
      alignment: AlignmentGeometry.topCenter,
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 8.r),
          clipBehavior: Clip.antiAlias,
          width: width * 0.25,
          height: 130.h,
          decoration: BoxDecoration(
            color: AppTheme.darkBrown,
            // border: Border.all(),
            borderRadius: BorderRadius.circular(15.sp),
          ),
          child: Column(
            children: [
              Spacer(),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.black.withAlpha(
                        (0.15 * 255).toInt(),
                      ), // 0.15 opacity
                      spreadRadius: 1,
                      blurRadius: 12,
                      offset: Offset(0, 6),
                    ),
                    BoxShadow(
                      color: AppTheme.black.withAlpha(
                        (0.05 * 255).toInt(),
                      ), // 0.05 opacity
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Tomato",
                      style: textTheme.labelSmall!.copyWith(
                        fontSize: 14.sp,
                        color: AppTheme.white,
                      ),
                    ),
                    GestureDetector(onTap: () {}, child: Image.asset(addIcon)),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          // margin: EdgeInsets.only(bottom: ),
          padding: EdgeInsets.all(12.r),
          width: width * 0.25,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppTheme.black.withAlpha(
                  (0.15 * 255).toInt(),
                ), // 0.15 opacity
                spreadRadius: 1,
                blurRadius: 12,
                offset: Offset(0, 6),
              ),
              BoxShadow(
                color: AppTheme.black.withAlpha(
                  (0.05 * 255).toInt(),
                ), // 0.05 opacity
                spreadRadius: 1,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
            color: AppTheme.white,
            // border: Border.all(),
            borderRadius: BorderRadius.circular(15.sp),
          ),
          child: Image.asset("assets/icons/tp.png"),
        ),
      ],
    );
  }
}
