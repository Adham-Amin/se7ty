// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:se7ty/core/utils/app_colors.dart';
import 'package:se7ty/core/utils/app_styles.dart';
import 'package:se7ty/features/patient/appointments/presentation/views/appointments_view.dart';
import 'package:se7ty/features/patient/home/presentation/page/patient_home_view.dart';
import 'package:se7ty/features/patient/search/presentation/page/search_view.dart';

class PatientMainView extends StatefulWidget {
  const PatientMainView({super.key});

  static final GlobalKey<_MainPageState> mainViewKey = GlobalKey();

  @override
  State<PatientMainView> createState() => _MainPageState();
}

class _MainPageState extends State<PatientMainView> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    PatientHomeView(),
    PatientSearchView(),
    PatientAppointmentsView(),
    // PatientProfileScreen(),
  ];

  void changeTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
        decoration: BoxDecoration(
          color: isDark ? AppColors.dark : Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withValues(alpha: .2),
            ),
          ],
        ),
        child: GNav(
          curve: Curves.easeOutExpo,
          rippleColor: AppColors.grey,
          hoverColor: AppColors.grey,
          haptic: true,
          tabBorderRadius: 20,
          gap: 5,
          activeColor: AppColors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          duration: const Duration(milliseconds: 400),
          tabBackgroundColor: AppColors.primary,
          textStyle: AppStyles.textBold18.copyWith(color: AppColors.white),
          tabs: const [
            GButton(iconSize: 28, icon: Icons.home, text: 'الرئيسية'),
            GButton(icon: Icons.search, text: 'البحث'),
            GButton(
              iconSize: 28,
              icon: Icons.calendar_month_rounded,
              text: 'المواعيد',
            ),
            GButton(iconSize: 29, icon: Icons.person, text: 'الحساب'),
          ],
          selectedIndex: _selectedIndex,
          onTabChange: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
        ),
      ),
    );
  }
}
