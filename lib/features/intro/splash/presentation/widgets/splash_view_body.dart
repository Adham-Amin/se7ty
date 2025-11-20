// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:se7ty/core/routes/app_routes.dart';
import 'package:se7ty/core/services/shared_preferences_service.dart';
import 'package:se7ty/core/utils/app_assets.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (Prefs.getBool('SeenOn') == true) {
        Navigator.pushReplacementNamed(context, AppRoutes.welcomeView);
      } else {
        Navigator.pushReplacementNamed(context, AppRoutes.onbordingView);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Image.asset(AppAssets.imagesLogo, width: 280.w));
  }
}
