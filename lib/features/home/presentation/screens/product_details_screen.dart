import 'package:flutter/material.dart';
import 'package:hungry_app/features/home/domain/entities/product_entity.dart';
import 'package:hungry_app/features/home/presentation/widgets/product_details.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const String routeName = "ProductDetailsScreen";
  const ProductDetailsScreen({super.key});

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
