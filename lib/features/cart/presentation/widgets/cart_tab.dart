import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/features/cart/presentation/widgets/cart_item.dart';
import 'package:hungry_app/features/products/presentation/widgets/total_price_with_action.dart';

class CartTab extends StatelessWidget {
  const CartTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.r),
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: 12,
              separatorBuilder: (context, index) => SizedBox(height: 20.h),
              itemBuilder: (_, index) => CartItem(),
            ),
          ),
          SizedBox(height: 10),
          TotalPriceWithAction(
            width: 200,
            onPressed: () {},
            totalPrice: 100,
            title: "Checkout",
          ),
        ],
      ),
    );
  }
}
