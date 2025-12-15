import 'package:flutter/material.dart';
import 'package:hungry_app/features/home/domain/entities/product_entity.dart';
import 'package:hungry_app/features/home/presentation/widgets/product_details.dart';

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
        body: ProductDetails(
          product: product,
          width: width,
          textTheme: textTheme,
        ),
      ),
    );
  }
}
