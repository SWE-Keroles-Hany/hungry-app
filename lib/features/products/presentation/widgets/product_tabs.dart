import 'package:flutter/material.dart';
import 'package:hungry_app/core/theme/app_theme.dart';
import 'package:hungry_app/features/products/presentation/widgets/tab_item.dart';

import 'home_tab.dart';

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

      child: Row(
        children: List.generate(
          5,
          (index) => GestureDetector(
            onTap: () {
              setState(() {
                selectedTab = index;
              });
            },
            child: TabItem(
              titleColor: selectedTab == index
                  ? AppTheme.white
                  : AppTheme.mediumGray,
              textTheme: textTheme,
              title: "All",
              bgColor: selectedTab == index
                  ? AppTheme.primaryColor
                  : AppTheme.lightGray,
            ),
          ),
        ),
      ),
    );
  }
}
