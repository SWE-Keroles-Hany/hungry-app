import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/constants/text_constants.dart';
import 'package:hungry_app/core/theme/app_theme.dart';
import 'package:hungry_app/features/cart/presentation/widgets/cart_tab.dart';
import 'package:hungry_app/features/home/presentation/widgets/home_tab.dart';
import 'package:hungry_app/features/order_history/presentation/widgets/order_history_tab.dart';
import 'package:hungry_app/features/profile/presentation/screens/profile_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTab = 0;

  final List<Widget> tabs = [
    HomeTab(),
    CartTab(),
    OrderHistoryTab(),
    ProfileTab(),
  ];

  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      label: TextConstants.home,
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.cart),
      label: TextConstants.cart,
    ),

    BottomNavigationBarItem(
      icon: Icon(Icons.local_restaurant_sharp),
      label: TextConstants.orderHistory,
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.profile_circled),
      label: TextConstants.profile,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: tabs[selectedTab],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                spreadRadius: 1, // how much the shadow spreads
                blurRadius: 10, // softness
                offset: Offset(0, -3), // vertical shadow, negative for top
              ),
            ],
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.r),
              topLeft: Radius.circular(30.r),
            ),
            color: AppTheme.primaryColor,
          ),
          child: BottomNavigationBar(
            currentIndex: selectedTab,
            selectedItemColor: AppTheme.white,
            unselectedItemColor: AppTheme.mediumGray,
            backgroundColor: Colors.transparent,
            onTap: onTapChage,
            items: items,
          ),
        ),
      ),
    );
  }

  onTapChage(int value) {
    setState(() {
      selectedTab = value;
    });
  }
}
