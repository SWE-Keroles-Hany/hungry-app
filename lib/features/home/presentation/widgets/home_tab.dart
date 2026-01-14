import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/constants/image_constants.dart';
import 'package:hungry_app/features/home/presentation/widgets/home_header.dart';
import 'package:hungry_app/features/home/presentation/widgets/product_list.dart';
import 'package:hungry_app/features/home/presentation/widgets/category_tabs.dart';
import 'package:hungry_app/features/home/presentation/widgets/search_text_form.dart';
import 'package:hungry_app/features/home/presentation/widgets/user_name.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15.h),
          //! Header
          HomeHeader(imgURL: ImageConstants.product),
          //! User Name
          UserName(),
          SizedBox(height: 10.h),
          //! Search
          SearchTextForm(),
          SizedBox(height: 12.h),
          //! Categories
          CategorieTabs(),
          SizedBox(height: 12.h),
          //! Products
          ProductList(),
          SizedBox(height: 12.h),
        ],
      ),
    );
  }
}
