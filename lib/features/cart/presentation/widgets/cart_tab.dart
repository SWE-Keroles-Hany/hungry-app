import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/constants/text_constants.dart';
import 'package:hungry_app/core/helper/app_helper.dart';
import 'package:hungry_app/core/service_locator/get_it.dart';
import 'package:hungry_app/core/theme/app_theme.dart';
import 'package:hungry_app/core/utils/ui_utils.dart';
import 'package:hungry_app/core/widgets/custom_loading_shimmer.dart';
import 'package:hungry_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:hungry_app/features/cart/presentation/cubit/cart_states.dart';
import 'package:hungry_app/features/cart/presentation/widgets/cart_list_with_price.dart';
import 'package:hungry_app/features/home/presentation/widgets/product_list.dart';

class CartTab extends StatefulWidget {
  const CartTab({super.key});

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  @override
  void initState() {
    super.initState();
    getIt<CartCubit>().getCart();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocConsumer<CartCubit, CartStates>(
      listenWhen: (previous, current) {
        return current is LoadingDeleteFromCartState ||
            current is SuccessDeleteFromCartState ||
            current is ErrorDeleteFromCartState;
      },

      buildWhen: (previous, current) {
        return current is LoadingGetCartState ||
            current is SuccessGetCartState ||
            current is ErrorGetCartState;
      },

      listener: (context, state) {
        if (state is ErrorDeleteFromCartState) {
          UiUtils.hideLoading(context);
          UiUtils.showMessage(message: state.message, isErrorMessage: true);
        } else if (state is LoadingDeleteFromCartState) {
          UiUtils.showLoadingIndicator(context);
        } else if (state is SuccessDeleteFromCartState) {
          UiUtils.hideLoading(context);
          UiUtils.showMessage(
            message: "Deleted Successfully",
            isSuccessMessage: true,
          );
        }
      },

      builder: (context, state) {
        if (state is ErrorGetCartState) {
          return Center(
            child: Text(
              style: textTheme.labelMedium!.copyWith(color: AppTheme.red),
              state.message,
            ),
          );
        } else if (state is LoadingGetCartState) {
          return CustomLoadingShimmer(children: GetCartItms());
        } else if (state is SuccessGetCartState &&
            state.cartList.items!.isEmpty) {
          return Center(
            child: Text(
              style: textTheme.labelMedium!.copyWith(
                color: AppTheme.primaryColor,
              ),
              TextConstants.noItemsInCart,
            ),
          );
        } else if (state is SuccessGetCartState) {
          final cartResponse = state.cartList;
          return Padding(
            padding: EdgeInsets.all(20.r),
            child: CartListAndTotalPrice(cart: cartResponse),
          );
        }
        return const SizedBox();
      },
    );
  }
}
