import 'package:flutter/material.dart';
import 'package:se7ty/core/utils/app_colors.dart';
import 'package:se7ty/core/utils/app_styles.dart';
import 'package:se7ty/features/auth/presentation/widgets/register_view_body.dart';
import 'package:se7ty/features/intro/welcome/data/model/user_type_enum.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key, required this.userType});

  final UserTypeEnum userType;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDark ? AppColors.black : AppColors.white,
        title: Text('تسجيل حساب جديد', style: AppStyles.textBold18),
      ),
      body: RegisterViewBody(userType: userType),
    );
  }
}
