import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:se7ty/core/routes/app_routes.dart';
import 'package:se7ty/core/utils/app_assets.dart';
import 'package:se7ty/core/utils/app_colors.dart';
import 'package:se7ty/core/utils/app_styles.dart';
import 'package:se7ty/core/widgets/custom_rich_text.dart';
import 'package:se7ty/features/auth/presentation/widgets/form_register.dart';
import 'package:se7ty/features/intro/welcome/data/model/user_type_enum.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key, required this.userType});

  final UserTypeEnum userType;

  String handleUserType() {
    if (userType == UserTypeEnum.doctor) {
      return 'دكتور';
    } else {
      return 'مريض';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          const SizedBox(height: 40),
          Image.asset(AppAssets.imagesLogo, height: 250),
          const SizedBox(height: 20),
          Text(
            'سجل دخول الان كـ "${handleUserType()}"',
            style: AppStyles.textBold18.copyWith(color: AppColors.primary),
          ),
          const SizedBox(height: 30),
          FormRegister(userType: userType),
          SizedBox(height: 32.h),
          CustomRichText(
            text: 'لدي حساب ؟',
            linkText: 'سجل دخول',
            onTap: () {
              Navigator.pushReplacementNamed(
                context,
                AppRoutes.loginView,
                arguments: userType,
              );
            },
          ),
          SizedBox(height: 32.h),
        ],
      ),
    );
  }
}
