import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/helper/app_helper.dart';
import 'package:hungry_app/core/theme/app_theme.dart';
import 'package:hungry_app/core/utils/ui_utils.dart';
import 'package:hungry_app/features/home/presentation/widgets/product_list.dart';
import 'package:hungry_app/features/order_history/presentation/cubit/orders_cubit.dart';
import 'package:hungry_app/features/order_history/presentation/cubit/orders_states.dart';
import 'package:hungry_app/features/order_history/presentation/widgets/order_history_item.dart';

class OrderHistoryTab extends StatelessWidget {
  const OrderHistoryTab({super.key});
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocBuilder<OrdersCubit, OrdersStates>(
      builder: (context, state) {
        if (state is LoadingGetAllOrdersState) {
          return CustomLoadingShimmer(children: GetOrderHistoryItems());
        } else if (state is ErrorGetAllOrdersState) {
          return Center(
            child: Text(
              state.message,
              style: textTheme.labelMedium!.copyWith(color: AppTheme.red),
            ),
          );
        } else if (state is SuccessGetAllOrdersState && state.order.isEmpty) {
          return Center(
            child: Text(
              "No Orders",
              style: textTheme.labelMedium!.copyWith(
                color: AppTheme.primaryColor,
              ),
            ),
          );
        } else if (state is SuccessGetAllOrdersState) {
          final orders = state.order;
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
        return SizedBox();
      },
    );
  }
}
