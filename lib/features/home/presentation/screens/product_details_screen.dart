import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/service_locator/get_it.dart';
import 'package:hungry_app/core/theme/app_theme.dart';
import 'package:hungry_app/core/utils/ui_utils.dart';
import 'package:hungry_app/features/home/domain/entities/product_entity.dart';
import 'package:hungry_app/features/home/presentation/cubit/products_cubit.dart';
import 'package:hungry_app/features/home/presentation/cubit/products_states.dart';
import 'package:hungry_app/features/home/presentation/widgets/custom_slider.dart';
import 'package:hungry_app/features/home/presentation/widgets/side_option_item.dart';
import 'package:hungry_app/features/home/presentation/widgets/side_options_title.dart';
import 'package:hungry_app/features/home/presentation/widgets/total_price_with_action.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const String routeName = "ProductDetailsScreen";
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as ProductEntity;
    final textTheme = Theme.of(context).textTheme;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: BlocProvider(
          create: (context) => getIt<ProductsCubit>()
            ..getSideOptionsProducts()
            ..getToppings(),

          child: ProductDetails(
            product: product,
            width: width,
            textTheme: textTheme,
          ),
        ),
      ),
    );
  }
}

class ProductDetails extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CachedNetworkImage(imageUrl: product.image!, width: width * 0.45),
              SizedBox(width: 30.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name ?? "",
                      style: textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                    SizedBox(height: 20.w),
                    CustomSlider(),
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
              buildWhen: (previous, current) =>
                  current is LoadingGetSideOptoinProductsState ||
                  current is ErrorGetSideOptoinProductsState ||
                  current is SuccessGetSideOptoinProductsState,

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
              buildWhen: (previous, current) =>
                  current is LoadingGetToppgingsProductsState ||
                  current is ErrorGetToppgingsProductsState ||
                  current is SuccessGetToppgingsProductsState,

              builder: (context, state) {
                if (state is LoadingGetToppgingsProductsState) {
                  return UiUtils.showLoaidng();
                } else if (state is ErrorGetToppgingsProductsState) {
                  return Center(child: Text(state.message));
                } else if (state is SuccessGetToppgingsProductsState) {
                  final sideOptionsProducts = state.products;

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
          Spacer(),

          TotalPriceWithAction(
            width: 200,
            totalPrice: 20,
            onPressed: () {},
            title: "Add To Cart",
          ),
        ],
      ),
    );
  }
}
