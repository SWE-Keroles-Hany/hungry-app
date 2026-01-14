import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/constants/text_constants.dart';
import 'package:hungry_app/core/utils/ui_utils.dart';
import 'package:hungry_app/features/cart/domain/entities/cart_item_request_entity.dart';
import 'package:hungry_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:hungry_app/features/cart/presentation/cubit/cart_states.dart';
import 'package:hungry_app/features/home/domain/entities/product_entity.dart';
import 'package:hungry_app/features/home/presentation/widgets/product_info.dart';
import 'package:hungry_app/features/home/presentation/widgets/side_options_products.dart';
import 'package:hungry_app/features/home/presentation/widgets/side_options_title.dart';
import 'package:hungry_app/features/home/presentation/widgets/toppings_products.dart';
import 'package:hungry_app/features/home/presentation/widgets/total_price_with_action.dart';

// ignore: must_be_immutable
class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.product});

  final ProductEntity product;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  List<int> toppings = [];
  List<int> sideOptions = [];
  double spicyValue = 0.1;
  int quntity = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.r),
      child: BlocListener<CartCubit, CartStates>(
        listener: (context, state) {
          if (state is ErrorAddToCartState) {
            UiUtils.hideLoading(context);
            UiUtils.showMessage(isErrorMessage: true, message: state.message);
          } else if (state is LoadingAddToCartState) {
            UiUtils.showLoadingIndicator(context);
          } else if (state is SuccessAddToCartState) {
            UiUtils.hideLoading(context);
            Navigator.of(context).pop();
            UiUtils.showMessage(
              isSuccessMessage: true,
              message: TextConstants.addedToCart,
            );
            BlocProvider.of<CartCubit>(context).getCart();
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //! Title + Image + Spicy Number
            ProductInfo(
              product: widget.product,
              spicyValue: spicyValue,
              onChanged: (value) {
                setState(() {
                  spicyValue = value;
                });
              },
            ),
            SizedBox(height: 20.h),
            //! Side Options Title
            SideOptionsTitle(title: "Side Options"),
            SizedBox(height: 10.h),
            //! Side Option Products
            SideOptionsProducts(),
            SizedBox(height: 10.h),
            //! Side Options Title
            SideOptionsTitle(title: "Toppings"),
            SizedBox(height: 10.h),
            //! Side Options Products
            ToppingsProducts(),
            SizedBox(height: 20.w),

            //! Total Price
            Spacer(),
            TotalPriceWithAction(
              width: 200,
              totalPrice: "${widget.product.price}",
              onPressed: addToCart,
              title: TextConstants.addToCart,
            ),
          ],
        ),
      ),
    );
  }

  addToCart() async {
    await BlocProvider.of<CartCubit>(context).addToCart(
      cartItem: CartItemRequestEntity(
        sideOptions: sideOptions,
        spicy: spicyValue,
        toppings: toppings,
        productId: widget.product.id!,
        quantity: 1,
      ),
    );
  }
}
