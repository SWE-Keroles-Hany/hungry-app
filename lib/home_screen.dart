import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/theme/app_theme.dart';
import 'package:hungry_app/features/cart/presentation/widgets/cart_tab.dart';
import 'package:hungry_app/features/products/presentation/widgets/home_tab.dart';
import 'package:hungry_app/features/profile/presentation/screens/profile_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTab = 0;

  final List<Widget> tabs = [HomeTab(), CartTab(), Text("3"), ProfileTab()];

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
            onTap: (value) {
              setState(() {
                selectedTab = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.cart),
                label: "Cart",
              ),

              BottomNavigationBarItem(
                icon: Icon(Icons.local_restaurant_sharp),
                label: "Order History",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.profile_circled),
                label: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
