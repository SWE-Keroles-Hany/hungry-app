import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/helper/app_helper.dart';
import 'package:hungry_app/features/home/presentation/cubit/products_cubit.dart';
import 'package:hungry_app/features/home/presentation/cubit/products_states.dart';
import 'package:hungry_app/features/home/presentation/screens/product_details_screen.dart';
import 'package:hungry_app/features/home/presentation/widgets/product_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return BlocBuilder<ProductsCubit, ProductsStates>(
      builder: (context, state) {
        if (state is LoadingGetProductsState) {
          return Expanded(
            child: ProductsLoadingShimmer(children: GetDummyProducts()),
          );
        } else if (state is ErrorGetProductsState) {
          return Center(child: Text(state.message));
        } else if (state is SuccessGetProductsState && state.products.isEmpty) {
          return Center(child: Text("No Products"));
        } else if (state is SuccessGetProductsState) {
          final allProducts = state.products;
          return Expanded(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
              itemCount: allProducts.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 15.r,
                mainAxisSpacing: 15.r,
                mainAxisExtent: height * 0.25,
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      ProductDetailsScreen.routeName,
                      arguments: allProducts[index],
                    );
                  },
                  child: ProductItem(
                    imgURL:
                        allProducts[index].image ??
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdpU431xPGZoWC2RW7DAlWe29mnpo2z5m13Q&s",
                    description: allProducts[index].description ?? "",
                    rate: allProducts[index].rating ?? "",
                    title: allProducts[index].name ?? "",
                  ),
                );
              },
            ),
          );
        }
        return SizedBox();
      },
    );
  }
}

class ProductsLoadingShimmer extends StatelessWidget {
  const ProductsLoadingShimmer({super.key, required this.children});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return Skeletonizer(
      child: GridView(
        padding: EdgeInsets.symmetric(vertical: 10.h),

        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 15.r,
          mainAxisSpacing: 15.r,
          mainAxisExtent: height * 0.25,
          crossAxisCount: 2,
        ),
        children: children,
      ),
    );
  }
}

class CustomLoadingShimmer extends StatelessWidget {
  const CustomLoadingShimmer({
    super.key,
    this.isSideOptions = false,
    required this.children,
  });
  final List<Widget> children;
  final isSideOptions;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: ListView(
        scrollDirection: isSideOptions ? Axis.horizontal : Axis.vertical,
        padding: EdgeInsets.all(20.r),
        children: children,
      ),
    );
  }
}
