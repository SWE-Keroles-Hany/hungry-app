import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/features/products/presentation/screens/product_details_screen.dart';
import 'package:hungry_app/features/products/presentation/widgets/product_item.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final textTheme = Theme.of(context).textTheme;
    return Expanded(
      child: GridView.builder(
        itemCount: 10,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 15.r,
          mainAxisSpacing: 15.r,
          mainAxisExtent: height * 0.25,
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(ProductDetailsScreen.routeName);
            },
            child: ProductItem(
              imgURL: "assets/images/image.png",
              textTheme: textTheme,
              description: 'Kero',
              rate: 1,
              title: 'asdf',
            ),
          );
        },
      ),
    );
  }
}
