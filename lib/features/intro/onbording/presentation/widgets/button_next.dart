import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:se7ty/core/routes/app_routes.dart';
import 'package:se7ty/core/services/shared_preferences_service.dart';
import 'package:se7ty/core/utils/app_colors.dart';
import 'package:se7ty/core/utils/app_styles.dart';
import 'package:se7ty/features/intro/onbording/data/model/onbording_model.dart';

class ButtonNext extends StatelessWidget {
  const ButtonNext({super.key, required this.currentPage});

  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: currentPage == OnbordingModel.onbordingList.length - 1,
      maintainState: true,
      maintainAnimation: true,
      maintainSize: true,
      child: GestureDetector(
        onTap: () async {
          await Prefs.setBool('SeenOn', true);
          Navigator.pushReplacementNamed(context, AppRoutes.welcomeView);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Text(
            'هيا بنا',
            style: AppStyles.textRegular16.copyWith(color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
