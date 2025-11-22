import 'package:flutter/material.dart';
import 'package:se7ty/core/utils/app_colors.dart';
import 'package:se7ty/core/utils/app_styles.dart';
import 'package:se7ty/features/auth/presentation/widgets/login_view_body.dart';
import 'package:se7ty/features/intro/welcome/data/model/user_type_enum.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key, required this.userType});

  final UserTypeEnum userType;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDark ? AppColors.black : AppColors.white,
        title: Text('تسجيل دخول', style: AppStyles.textBold18),
      ),
      body: LoginViewBody(userType: userType),
    );
  }
}
