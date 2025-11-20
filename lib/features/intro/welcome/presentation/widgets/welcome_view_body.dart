import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:se7ty/core/utils/app_assets.dart';
import 'package:se7ty/core/utils/app_colors.dart';
import 'package:se7ty/core/utils/app_styles.dart';
import 'package:se7ty/core/widgets/custom_button.dart';
import 'package:se7ty/core/widgets/height_and_width.dart';

class WelcomeViewBody extends StatelessWidget {
  const WelcomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppAssets.imagesWelcomeBg,
          width: double.infinity,
          fit: BoxFit.cover,
          height: double.infinity,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(flex: 1),
              Text(
                'اهلا بيك',
                style: AppStyles.textBold32.copyWith(color: AppColors.primary),
              ),
              HeightBox(16),
              Text(
                'سجل واحجز عند دكتورك وانت فالبيت',
                style: AppStyles.textRegular16,
              ),
              Spacer(flex: 3),
              Container(
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.6),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Text(
                      'سجل دلوقتي ك',
                      style: AppStyles.textMedium18.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    HeightBox(32),
                    CustomButton(
                      title: 'دكتور',
                      onTap: () {},
                      backgroundColor: AppColors.white,
                      colortext: AppColors.black,
                    ),
                    HeightBox(16),
                    CustomButton(
                      title: 'مريض',
                      onTap: () {},
                      backgroundColor: AppColors.white,
                      colortext: AppColors.black,
                    ),
                  ],
                ),
              ),
              Spacer(flex: 1),
            ],
          ),
        ),
      ],
    );
  }
}
