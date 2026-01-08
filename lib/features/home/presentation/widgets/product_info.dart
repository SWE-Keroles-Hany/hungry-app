import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/constants/app_constants.dart';
import 'package:hungry_app/core/theme/app_theme.dart';
import 'package:hungry_app/features/home/presentation/widgets/custom_slider.dart';

import '../../domain/entities/product_entity.dart' show ProductEntity;

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    super.key,
    required this.product,
    this.spicyValue,
    required this.onChanged,
  });
  final ProductEntity product;
  final spicyValue;
  final Function(double)? onChanged;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      child: Row(
        children: [
          //! image
          CachedNetworkImage(
            imageUrl: product.image ?? AppConstants.image,
            width: width * 0.45,
          ),
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
                CustomSlider(value: spicyValue, onChanged: onChanged),
              ],
            ),
          ),
          SizedBox(width: 30.w),
        ],
      ),
    );
  }
}
