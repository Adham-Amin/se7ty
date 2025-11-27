import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:se7ty/core/routes/app_routes.dart';
import 'package:se7ty/core/utils/app_assets.dart';
import 'package:se7ty/core/utils/app_colors.dart';
import 'package:se7ty/core/utils/app_styles.dart';
import 'package:se7ty/core/widgets/height_and_width.dart';
import 'package:se7ty/features/intro/welcome/data/model/user_type_enum.dart';

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
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: .5),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: .3),
                      blurRadius: 15,
                      offset: const Offset(5, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      'سجل دلوقتي ك',
                      style: AppStyles.textRegular16.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    HeightBox(32),
                    UserButton(
                      title: 'دكتور',
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.registerView,
                          arguments: UserTypeEnum.doctor,
                        );
                      },
                    ),
                    HeightBox(16),
                    UserButton(
                      title: 'مريض',
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.registerView,
                          arguments: UserTypeEnum.patient,
                        );
                      },
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

class UserButton extends StatelessWidget {
  const UserButton({super.key, required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: AppColors.accent.withValues(alpha: .7),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            title,
            style: AppStyles.textBold18.copyWith(color: AppColors.dark),
          ),
        ),
      ),
    );
  }
}
