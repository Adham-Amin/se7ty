import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:se7ty/core/routes/app_routes.dart';
import 'package:se7ty/core/utils/app_assets.dart';
import 'package:se7ty/core/utils/app_colors.dart';
import 'package:se7ty/core/utils/app_styles.dart';
import 'package:se7ty/core/widgets/custom_rich_text.dart';
import 'package:se7ty/features/auth/presentation/widgets/login_form.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Form(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Image.asset(AppAssets.imagesLogo, height: 250),
            const SizedBox(height: 20),
            Text(
              'سجل دخول الان',
              style: AppStyles.textBold18.copyWith(color: AppColors.primary),
            ),
            const SizedBox(height: 30),
            LoginForm(),
            SizedBox(height: 32.h),
            CustomRichText(
              text: 'ليس لدي حساب ؟',
              linkText: 'سجل الان',
              onTap: () {
                Navigator.pushReplacementNamed(context, AppRoutes.registerView);
              },
            ),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }
}
