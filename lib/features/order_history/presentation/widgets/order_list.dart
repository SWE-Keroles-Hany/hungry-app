import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/features/order_history/domain/entities/order_entity.dart';
import 'package:hungry_app/features/order_history/presentation/widgets/order_history_item.dart';

class OrderList extends StatelessWidget {
  const OrderList({super.key, required this.orders});

  final List<OrderEntity> orders;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.r),
      child: ListView.separated(
        itemBuilder: (_, index) => OrderHistoryItem(
          imgURL: orders[index].productImage,
          onPressed: () {},
          price: orders[index].totalPrice,
          quantity: 1,
          title: "Title",
        ),
        separatorBuilder: (_, _) => SizedBox(height: 20.h),
        itemCount: orders.length,
      ),
    );
  }
}
