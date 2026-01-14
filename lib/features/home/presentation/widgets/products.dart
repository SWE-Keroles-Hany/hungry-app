import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/features/home/domain/entities/product_entity.dart';
import 'package:hungry_app/features/home/presentation/screens/product_details_screen.dart';
import 'package:hungry_app/features/home/presentation/widgets/product_item.dart';

class Products extends StatelessWidget {
  const Products({super.key, required this.allProducts, required this.height});

  final List<ProductEntity> allProducts;
  final double height;

  @override
  Widget build(BuildContext context) {
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
              imgURL: allProducts[index].image!,
              description: allProducts[index].description!,
              rate: allProducts[index].rating ?? "",
              title: allProducts[index].name ?? "",
            ),
          );
        },
      ),
    );
  }
}
