import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/core/helper/app_helper.dart';
import 'package:hungry_app/core/theme/app_theme.dart';
import 'package:hungry_app/features/home/domain/entities/category_entity.dart';
import 'package:hungry_app/features/home/presentation/cubit/categories_cubit.dart';
import 'package:hungry_app/features/home/presentation/cubit/categories_states.dart';
import 'package:hungry_app/features/home/presentation/cubit/products_cubit.dart';
import 'package:hungry_app/features/home/presentation/widgets/tab_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategorieTabs extends StatefulWidget {
  const CategorieTabs({super.key});

  @override
  State<CategorieTabs> createState() => _CategorieTabsState();
}

class _CategorieTabsState extends State<CategorieTabs> {
  Color bgColor = AppTheme.primaryColor;
  Color titleColor = AppTheme.white;
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,

      child: BlocBuilder<CategoriesCubit, CategoriesStates>(
        builder: (context, state) {
          if (state is LoadingGetAllCategoriesState) {
            return CategoryLoading();
          } else if (state is ErrorGetAllCategoriesState) {
            return Center(child: Text(state.message));
          } else if (state is SuccessGetAllCategoriesState) {
            final allCategories = state.categories;
            return CategoryList(allCategories);
          }
          return SizedBox();
        },
      ),
    );
  }

  Row CategoryList(List<CategoryEntity> allCategories) {
    return Row(
      children: List.generate(
        allCategories.length,
        (index) => GestureDetector(
          onTap: () async {
            await onTapChange(index);
          },
          child: TabItem(
            titleColor: selectedTab == index
                ? AppTheme.white
                : AppTheme.mediumGray,
            title: allCategories[index].name ?? "",
            bgColor: selectedTab == index
                ? AppTheme.primaryColor
                : AppTheme.lightGray,
          ),
        ),
      ),
    );
  }

  Future<void> onTapChange(int index) async {
    setState(() {
      selectedTab = index;
    });
    if (selectedTab == 0) {
      await context.read<ProductsCubit>().getProducts();
    } else {
      await context.read<ProductsCubit>().getProducts(categoryId: selectedTab);
    }
  }
}

class CategoryLoading extends StatelessWidget {
  const CategoryLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: SizedBox(
        child: Row(
          children: List.generate(
            GetDummyProducts().length,
            (index) => TabItem(title: "Tab Title"),
          ),
        ),
      ),
    );
  }
}
