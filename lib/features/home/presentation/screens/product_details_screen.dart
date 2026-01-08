import 'package:flutter/material.dart';
import 'package:hungry_app/core/service_locator/get_it.dart';
import 'package:hungry_app/features/home/domain/entities/product_entity.dart';
import 'package:hungry_app/features/home/presentation/cubit/side_options_cubt.dart';
import 'package:hungry_app/features/home/presentation/cubit/topping_cubit.dart';
import 'package:hungry_app/features/home/presentation/widgets/product_details.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const String routeName = "ProductDetailsScreen";
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    super.initState();
    getIt<ToppingsCubit>().getToppings();
    getIt<SideOptionsCubit>().getSideOptions();
  }

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as ProductEntity;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: ProductDetails(product: product),
      ),
    );
  }
}
