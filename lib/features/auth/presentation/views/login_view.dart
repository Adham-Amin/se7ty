import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7ty/core/services/firebase_service.dart';
import 'package:se7ty/core/utils/app_colors.dart';
import 'package:se7ty/core/utils/app_styles.dart';
import 'package:se7ty/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:se7ty/features/auth/data/repo/auth_repo_impl.dart';
import 'package:se7ty/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:se7ty/features/auth/presentation/widgets/login_view_body.dart';
import 'package:se7ty/features/intro/welcome/data/model/user_type_enum.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key, required this.userType});

  final UserTypeEnum userType;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return BlocProvider(
      create: (context) => AuthCubit(
        authRepo: AuthRepoImpl(
          authRemoteDataSource: AuthRemoteDataSourceImpl(
            firebaseService: FirebaseService(),
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: isDark ? AppColors.black : AppColors.white,
          title: Text('تسجيل دخول', style: AppStyles.textBold18),
        ),
        body: LoginViewBody(userType: userType),
      ),
    );
  }
}
