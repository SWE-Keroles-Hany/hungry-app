import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/utils/ui_utils.dart';
import 'package:hungry_app/features/cart/domain/entities/cart_list_response_entity.dart';
import 'package:hungry_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:hungry_app/features/cart/presentation/widgets/cart_item.dart';
import 'package:hungry_app/features/checkout/presentation/screens/checkout_screen.dart';
import 'package:hungry_app/features/home/presentation/widgets/total_price_with_action.dart';

class CartListAndTotalPrice extends StatelessWidget {
  const CartListAndTotalPrice({super.key, required this.cart});
  final CartListResponseEntity cart;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CartCubit>();
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            itemCount: cart.items!.length,
            separatorBuilder: (context, index) => SizedBox(height: 20.h),
            itemBuilder: (_, index) {
              final cartItem = cart.items![index];
              int quntity = cartItem.quantity!;
              return CartItem(
                price: cartItem.price!,
                onRemove: () async {
                  final itemId = cartItem.itemId;
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

                quntity: quntity,
                imgURL: cartItem.image!,
                name: cartItem.name!,
              );
            },
          ),
        ),
        SizedBox(height: 10),
        //! Total Price
        TotalPriceWithAction(
          width: 200,
          onPressed: () => Navigator.of(
            context,
          ).pushNamed(CheckoutScreen.routeName, arguments: cart),
          totalPrice: "${cart.totalPrice}",
          title: "Checkout",
        ),
      ],
    );
  }
}
