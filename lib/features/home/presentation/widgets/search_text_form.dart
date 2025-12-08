import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/theme/app_theme.dart';
import 'package:hungry_app/features/home/presentation/cubit/products_cubit.dart';

class SearchTextForm extends StatefulWidget {
  const SearchTextForm({super.key});

  @override
  State<SearchTextForm> createState() => _SearchTextFormState();
}

class _SearchTextFormState extends State<SearchTextForm> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppTheme.black.withAlpha(
              (0.15 * 255).toInt(),
            ), // 0.15 opacity
            spreadRadius: 1,
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
          BoxShadow(
            color: AppTheme.black.withAlpha(
              (0.05 * 255).toInt(),
            ), // 0.05 opacity
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        onChanged: (value) async {
          await BlocProvider.of<ProductsCubit>(
            context,
          ).getProducts(name: value, categoryId: 1);
        },
        controller: controller,
        cursorColor: AppTheme.darkBrown,
        cursorRadius: Radius.circular(2.r),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 18.h),
          fillColor: AppTheme.white,
          filled: true,
          hint: Text(
            "Search",
            style: textTheme.labelMedium!.copyWith(color: AppTheme.darkBrown),
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 8.w, right: 6.w),
            child: Image.asset(
              "assets/icons/search.png",
              // fit: BoxFit.contain,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20.r),
          ),
        ),
      ),
    );
  }
}
