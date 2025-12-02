import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7ty/core/services/firebase_service.dart';
import 'package:se7ty/core/utils/app_styles.dart';
import 'package:se7ty/features/patient/profile/data/data_source/profile_remote_data_source.dart';
import 'package:se7ty/features/patient/profile/data/repo/profile_repo_impl.dart';
import 'package:se7ty/features/patient/profile/presentation/cubit/change_pass_cubit.dart';
import 'package:se7ty/features/patient/profile/presentation/widgets/edit_profile_view_body.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePassCubit(
        profileRepo: ProfileRepoImpl(
          profileRemoteDataSource: ProfileRemoteDataSourceImpl(
            firebaseService: FirebaseService(),
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('تعديل الملف الشخصي', style: AppStyles.textBold18),
        ),
        body: EditProfileViewBody(),
      ),
    );
  }
}
