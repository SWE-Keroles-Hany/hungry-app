import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/features/order_history/presentation/widgets/order_history_item.dart';

class OrderHistoryTab extends StatelessWidget {
  const OrderHistoryTab({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.r),
      child: ListView.separated(
        itemBuilder: (_, index) => OrderHistoryItem(
          imgURL: "assets/images/image.png",
          onPressed: () {},
          price: 10,
          quantity: 2,
          title: "kekro",
        ),
        separatorBuilder: (_, _) => SizedBox(height: 20.h),
        itemCount: 10,
      ),
    );
  }
}
