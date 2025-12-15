import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/theme/app_theme.dart';
import 'package:hungry_app/core/utils/ui_utils.dart';
import 'package:hungry_app/features/cart/domain/entities/cart_list_response_entity.dart';
import 'package:hungry_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:hungry_app/features/cart/presentation/cubit/cart_states.dart';
import 'package:hungry_app/features/cart/presentation/widgets/cart_item.dart';
import 'package:hungry_app/features/checkout/presentation/screens/checkout_screen.dart';
import 'package:hungry_app/features/home/presentation/widgets/total_price_with_action.dart';

/*
Tasks : 
3- plus , minus 
 */
class CartTab extends StatelessWidget {
  const CartTab({super.key});

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
          return UiUtils.showLoaidng();
        } else if (state is SuccessGetCartState &&
            state.cartList.items!.isEmpty) {
          return Center(
            child: Text(
              style: textTheme.labelMedium!.copyWith(
                color: AppTheme.primaryColor,
              ),
              "No Items In Cart",
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

class CartListAndTotalPrice extends StatefulWidget {
  const CartListAndTotalPrice({super.key, required this.cart});
  final CartListResponseEntity cart;

  @override
  State<CartListAndTotalPrice> createState() => _CartListAndTotalPriceState();
}

class _CartListAndTotalPriceState extends State<CartListAndTotalPrice> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CartCubit>();

    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            itemCount: widget.cart.items!.length,
            separatorBuilder: (context, index) => SizedBox(height: 20.h),
            itemBuilder: (_, index) {
              int quntity = widget.cart.items![index].quantity!;

              return CartItem(
                onPlusPressed: () {
                  log("on Plus Pressed");
                  quntity = quntity + 1;

                  log("*==>>$quntity");
                },

                onRemove: () async {
                  final itemId = widget.cart.items?[index].itemId;

                  if (itemId == null) {
                    UiUtils.showMessage(
                      message: "Some Thing Went Wrong",
                      isErrorMessage: true,
                    );
                  } else {
                    await cubit.deleteFromCart(productId: itemId).whenComplete(
                      () async {
                        await cubit.getCart();
                      },
                    );
                  }
                },
                onMinusPressed: () {
                  log("on Minus Pressed");
                  if (quntity == 0) {
                    return;
                  }
                  quntity--;

                  log("$quntity");
                },
                quntity: quntity,
                imgURL: widget.cart.items![index].image!,
                name: widget.cart.items![index].name!,
              );
            },
          ),
        ),
        SizedBox(height: 10),
        TotalPriceWithAction(
          width: 200,
          onPressed: () =>
              Navigator.of(context).pushNamed(CheckoutScreen.routeName),
          totalPrice: widget.cart.totalPrice!,
          title: "Checkout",
        ),
      ],
    );
  }

  // Future<void> onPlusPressed() async {}

  // Future<void> onMinusPressed() async {}
  // Future<void> onRemove() async {}
}
