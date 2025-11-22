import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7ty/core/services/firebase_service.dart';
import 'package:se7ty/core/utils/app_styles.dart';
import 'package:se7ty/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:se7ty/features/auth/data/repo/auth_repo_impl.dart';
import 'package:se7ty/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:se7ty/features/auth/presentation/widgets/doctor_registration_body.dart';

class DoctorRegisterView extends StatelessWidget {
  const DoctorRegisterView({super.key});

  @override
  Widget build(BuildContext context) {
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
          title: Text('إكمال عملية التسجيل', style: AppStyles.textBold18),
          centerTitle: true,
        ),
        body: const DoctorRegisterViewBody(),
      ),
    );
  }
}
