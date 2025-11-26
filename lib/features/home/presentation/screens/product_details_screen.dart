import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/theme/app_theme.dart';
import 'package:hungry_app/features/home/presentation/widgets/custom_slider.dart';
import 'package:hungry_app/features/home/presentation/widgets/side_option_item.dart';
import 'package:hungry_app/features/home/presentation/widgets/side_options_title.dart';
import 'package:hungry_app/features/home/presentation/widgets/total_price_with_action.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const String routeName = "ProductDetailsScreen";
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.all(20.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(child: Image.asset("assets/icons/pngwing.png")),
                  SizedBox(width: 30.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Customize Your Burger to Your Tastes. Ultimate Experience",
                          style: textTheme.labelMedium!.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppTheme.primaryColor,
                          ),
                        ),
                        SizedBox(height: 20.w),
                        CustomSlider(),
                      ],
                    ),
                  ),
                  SizedBox(width: 30.w),
                ],
              ),
              SizedBox(height: 20.h),
              SideOptionsTitle(title: "Toppings"),
              SizedBox(height: 10.h),
              SizedBox(
                height: 150.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) =>
                      SideOptionItem(addIcon: "assets/icons/add.png"),
                  separatorBuilder: (_, index) => SizedBox(width: 20.w),
                  itemCount: 10,
                ),
              ),
              SizedBox(height: 10.h),
              SideOptionsTitle(title: "Side options"),
              SizedBox(height: 10.h),
              SizedBox(
                height: 150.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) => SideOptionItem(
                    addIcon: "assets/icons/green_add_icon.png",
                  ),
                  separatorBuilder: (_, index) => SizedBox(width: 20.w),
                  itemCount: 10,
                ),
              ),
              SizedBox(height: 10.h),

              TotalPriceWithAction(
                width: 200,
                totalPrice: 20,
                onPressed: () {},
                title: "Add To Cart",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
