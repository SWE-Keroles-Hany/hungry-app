import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/core/constants/text_constants.dart';
import 'package:hungry_app/core/helper/app_helper.dart';
import 'package:hungry_app/features/home/presentation/cubit/products_cubit.dart';
import 'package:hungry_app/features/home/presentation/cubit/products_states.dart';
import 'package:hungry_app/features/home/presentation/widgets/prodcuts_loading_shimmer.dart';
import 'package:hungry_app/features/home/presentation/widgets/products.dart';

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
          return Center(child: Text(TextConstants.noProducts));
        } else if (state is SuccessGetProductsState) {
          final allProducts = state.products;
          return Products(allProducts: allProducts, height: height);
        }
        return SizedBox();
      },
    );
  }
}
