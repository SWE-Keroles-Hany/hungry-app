import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductsLoadingShimmer extends StatelessWidget {
  const ProductsLoadingShimmer({super.key, required this.children});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return Skeletonizer(
      child: GridView(
        padding: EdgeInsets.symmetric(vertical: 10.h),

        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 15.r,
          mainAxisSpacing: 15.r,
          mainAxisExtent: height * 0.25,
          crossAxisCount: 2,
        ),
        children: children,
      ),
    );
  }
}
