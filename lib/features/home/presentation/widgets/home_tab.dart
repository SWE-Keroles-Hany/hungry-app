import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/service_locator/get_it.dart';
import 'package:hungry_app/features/home/presentation/cubit/products_cubit.dart';
import 'package:hungry_app/features/home/presentation/widgets/home_header.dart';
import 'package:hungry_app/features/home/presentation/widgets/product_list.dart';
import 'package:hungry_app/features/home/presentation/widgets/product_tabs.dart';
import 'package:hungry_app/features/home/presentation/widgets/search_text_form.dart';
import 'package:hungry_app/features/home/presentation/widgets/welcome_message.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15.h),
          HomeHeader(imgURL: "assets/images/image.png"),
          WelcomeMessage(name: "Kero"),
          SizedBox(height: 10.h),
          SearchTextForm(),
          SizedBox(height: 12.h),
          ProductTabs(),
          SizedBox(height: 12.h),
          ProductList(),
          SizedBox(height: 12.h),
        ],
      ),
    );
  }
}
