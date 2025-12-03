import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7ty/core/services/firebase_service.dart';
import 'package:se7ty/core/utils/app_styles.dart';
import 'package:se7ty/features/doctor/profile/data/data_source/doc_profile_remote_data_source.dart';
import 'package:se7ty/features/doctor/profile/data/repo/doc_profile_repo_impl.dart';
import 'package:se7ty/features/doctor/profile/presentation/manager/cubit/doc_change_pass_cubit.dart';
import 'package:se7ty/features/doctor/profile/presentation/widgets/edit_doc_profile_view_body.dart';

class EditDocProfileView extends StatelessWidget {
  const EditDocProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DocChangePassCubit(
        docProfileRepo: DocProfileRepoImpl(
          docProfileRemoteDataSource: DocProfileRemoteDataSourceImpl(
            firebaseService: FirebaseService(),
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('تعديل الملف الشخصي', style: AppStyles.textBold18),
        ),
        body: EditDocProfileViewBody(),
      ),
    );
  }
}
