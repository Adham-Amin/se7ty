import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:se7ty/core/utils/app_colors.dart';
import 'package:se7ty/core/utils/app_styles.dart';
import 'package:se7ty/features/intro/onbording/data/model/onbording_model.dart';

class OnbordingItem extends StatelessWidget {
  const OnbordingItem({super.key, required this.item});

  final OnbordingModel item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(item.image, width: 280.w),
        SizedBox(height: 24.h),
        Text(
          item.title,
          style: AppStyles.textBold18.copyWith(color: AppColors.primary),
        ),
        SizedBox(height: 24.h),
        Text(
          item.description,
          style: AppStyles.textRegular14,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
