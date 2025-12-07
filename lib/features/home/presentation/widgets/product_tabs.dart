import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/core/theme/app_theme.dart';
import 'package:hungry_app/features/home/presentation/cubit/categories_cubit.dart';
import 'package:hungry_app/features/home/presentation/cubit/categories_states.dart';
import 'package:hungry_app/features/home/presentation/cubit/products_cubit.dart';
import 'package:hungry_app/features/home/presentation/cubit/products_states.dart';
import 'package:hungry_app/features/home/presentation/widgets/tab_item.dart';

class ProductTabs extends StatefulWidget {
  const ProductTabs({super.key});

  @override
  State<ProductTabs> createState() => _ProductTabsState();
}

class _ProductTabsState extends State<ProductTabs> {
  Color bgColor = AppTheme.primaryColor;
  Color titleColor = AppTheme.white;
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,

      child: BlocBuilder<CategoriesCubit, CategoriesStates>(
        builder: (context, state) {
          if (state is LoadingGetAllCategoriesState) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: AppTheme.primaryColor,
              ),
            );
          } else if (state is ErrorGetAllCategoriesState) {
            return Center(child: Text(state.message));
          } else if (state is SuccessGetAllCategoriesState) {
            final allCategories = state.categories;

            return Row(
              children: List.generate(
                allCategories.length,
                (index) => GestureDetector(
                  onTap: () async {
                    setState(() {
                      selectedTab = index;
                    });
                    await BlocProvider.of<ProductsCubit>(
                      context,
                    ).getProductsByCategory(categoryId: selectedTab);
                  },
                  child: TabItem(
                    titleColor: selectedTab == index
                        ? AppTheme.white
                        : AppTheme.mediumGray,
                    textTheme: textTheme,
                    title: allCategories[index].name ?? "",
                    bgColor: selectedTab == index
                        ? AppTheme.primaryColor
                        : AppTheme.lightGray,
                  ),
                ),
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
