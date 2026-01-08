import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/features/home/domain/entities/product_option_entity.dart';
import 'package:hungry_app/features/home/presentation/widgets/side_option_item.dart';

class CustomOptionList extends StatelessWidget {
  const CustomOptionList({super.key, required this.options});

  final List<ProductOptionEntity> options;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (_, index) => SideOptionItem(
        imgURL: options[index].image!,
        name: options[index].name!,
        addIcon: "assets/icons/green_add_icon.png",
      ),
      separatorBuilder: (_, index) => SizedBox(width: 20.w),
      itemCount: options.length,
    );
  }
}
