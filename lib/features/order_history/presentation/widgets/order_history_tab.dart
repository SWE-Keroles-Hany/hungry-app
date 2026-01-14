import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/core/constants/text_constants.dart';
import 'package:hungry_app/core/helper/app_helper.dart';
import 'package:hungry_app/core/theme/app_theme.dart';
import 'package:hungry_app/core/widgets/custom_loading_shimmer.dart';
import 'package:hungry_app/features/order_history/presentation/cubit/orders_cubit.dart';
import 'package:hungry_app/features/order_history/presentation/cubit/orders_states.dart';
import 'package:hungry_app/features/order_history/presentation/widgets/order_list.dart';

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
              TextConstants.noOrders,
              style: textTheme.labelMedium!.copyWith(
                color: AppTheme.primaryColor,
              ),
            ),
          );
        } else if (state is SuccessGetAllOrdersState) {
          final orders = state.order;
          return OrderList(orders: orders);
        }
        return SizedBox();
      },
    );
  }
}
