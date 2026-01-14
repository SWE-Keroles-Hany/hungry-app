import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomLoadingShimmer extends StatelessWidget {
  const CustomLoadingShimmer({
    super.key,
    this.isSideOptions = false,
    required this.children,
  });
  final List<Widget> children;
  final isSideOptions;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: ListView(
        scrollDirection: isSideOptions ? Axis.horizontal : Axis.vertical,
        padding: EdgeInsets.all(20.r),
        children: children,
      ),
    );
  }
}
