import 'package:flutter/material.dart';
import 'package:se7ty/core/utils/app_colors.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  static final GlobalKey<MainViewState> mainViewKey =
      GlobalKey<MainViewState>();

  @override
  State<MainView> createState() => MainViewState();
}

class MainViewState extends State<MainView> {
  int _currentIndex = 0;

  List<Widget> get _pages => [
    const Placeholder(),
    const Placeholder(),
    const Placeholder(),
  ];

  void changeTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => changeTab(index),
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: isDark ? AppColors.black : AppColors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: isDark ? AppColors.white : AppColors.black,
            ),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
              color: isDark ? AppColors.white : AppColors.black,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: isDark ? AppColors.white : AppColors.black,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
