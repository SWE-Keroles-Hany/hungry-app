import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/service_locator/get_it.dart';
import 'package:hungry_app/core/theme/app_theme.dart';
import 'package:hungry_app/core/utils/ui_utils.dart';
import 'package:hungry_app/features/cart/domain/entities/cart_item_request_entity.dart';
import 'package:hungry_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:hungry_app/features/cart/presentation/cubit/cart_states.dart';
import 'package:hungry_app/features/home/domain/entities/product_entity.dart';
import 'package:hungry_app/features/home/presentation/cubit/products_cubit.dart';
import 'package:hungry_app/features/home/presentation/cubit/products_states.dart';
import 'package:hungry_app/features/home/presentation/widgets/custom_slider.dart';
import 'package:hungry_app/features/home/presentation/widgets/side_option_item.dart';
import 'package:hungry_app/features/home/presentation/widgets/side_options_title.dart';
import 'package:hungry_app/features/home/presentation/widgets/total_price_with_action.dart';

// ignore: must_be_immutable
class ProductDetails extends StatefulWidget {
  const ProductDetails({
    super.key,
    required this.product,
    required this.width,
    required this.textTheme,
  });

  final ProductEntity product;
  final double width;
  final TextTheme textTheme;

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
    final textTheme = Theme.of(context).textTheme;
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
              message: "Added To Cart",
            );
            BlocProvider.of<CartCubit>(context).getCart();
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CachedNetworkImage(
                  imageUrl: widget.product.image!,
                  width: widget.width * 0.45,
                ),
                SizedBox(width: 30.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.name ?? "",
                        style: widget.textTheme.labelMedium!.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppTheme.primaryColor,
                        ),
                      ),
                      SizedBox(height: 20.w),
                      CustomSlider(
                        value: spicyValue,
                        onChanged: (value) {
                          setState(() {
                            spicyValue = value;
                            log("******$spicyValue");
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 30.w),
              ],
            ),
            SizedBox(height: 20.h),
            SideOptionsTitle(title: "Side Options"),
            SizedBox(height: 10.h),
            SizedBox(
              height: 150.h,
              child: BlocBuilder<ProductsCubit, ProductsStates>(
                bloc: getIt<ProductsCubit>()..getSideOptionsProducts(),

                builder: (context, state) {
                  if (state is LoadingGetSideOptoinProductsState) {
                    return UiUtils.showLoaidng();
                  } else if (state is ErrorGetSideOptoinProductsState) {
                    return Center(child: Text(state.message));
                  } else if (state is SuccessGetSideOptoinProductsState) {
                    final sideOptionsProducts = state.products;
                    return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) => SideOptionItem(
                        imgURL: sideOptionsProducts[index].image!,
                        name: sideOptionsProducts[index].name!,
                        addIcon: "assets/icons/add.png",
                      ),
                      separatorBuilder: (_, index) => SizedBox(width: 20.w),
                      itemCount: sideOptionsProducts.length,
                    );
                  }
                  return SizedBox();
                },
              ),
            ),
            SizedBox(height: 10.h),
            SideOptionsTitle(title: "Toppings"),
            SizedBox(height: 10.h),
            SizedBox(
              height: 150.h,
              child: BlocBuilder<ProductsCubit, ProductsStates>(
                bloc: getIt<ProductsCubit>()..getToppings(),

                builder: (context, state) {
                  if (state is LoadingGetToppgingsProductsState) {
                    return UiUtils.showLoaidng();
                  } else if (state is ErrorGetToppgingsProductsState) {
                    return Center(child: Text(state.message));
                  } else if (state is SuccessGetToppgingsProductsState) {
                    final sideOptionsProducts = state.products;
                    // sideOptionsProducts.
                    return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) => SideOptionItem(
                        imgURL: sideOptionsProducts[index].image!,
                        name: sideOptionsProducts[index].name!,
                        addIcon: "assets/icons/green_add_icon.png",
                      ),
                      separatorBuilder: (_, index) => SizedBox(width: 20.w),
                      itemCount: sideOptionsProducts.length,
                    );
                  }
                  return SizedBox();
                },
              ),
            ),
            SizedBox(height: 20.w),

            Spacer(),
            TotalPriceWithAction(
              width: 200,
              totalPrice: "${widget.product.price}",
              onPressed: () async {
                await BlocProvider.of<CartCubit>(context).addToCart(
                  cartItem: CartItemRequestEntity(
                    sideOptions: sideOptions,
                    spicy: spicyValue,
                    toppings: toppings,
                    productId: widget.product.id!,
                    quantity: 1,
                  ),
                );
              },
              title: "Add To Cart",
            ),
          ],
        ),
      ),
    );
  }
}
