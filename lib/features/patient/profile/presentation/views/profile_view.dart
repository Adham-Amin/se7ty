import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7ty/core/routes/app_routes.dart';
import 'package:se7ty/core/services/firebase_service.dart';
import 'package:se7ty/core/utils/app_styles.dart';
import 'package:se7ty/features/patient/profile/data/data_source/profile_remote_data_source.dart';
import 'package:se7ty/features/patient/profile/data/repo/profile_repo_impl.dart';
import 'package:se7ty/features/patient/profile/presentation/cubit/profile_cubit.dart';
import 'package:se7ty/features/patient/profile/presentation/widgets/profile_view_body.dart';

class PatientProfileView extends StatelessWidget {
  const PatientProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(
        profileRepo: ProfileRepoImpl(
          profileRemoteDataSource: ProfileRemoteDataSourceImpl(
            firebaseService: FirebaseService(),
          ),
        ),
      )..getProfile(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('حسابي', style: AppStyles.textBold18),
          actions: [
            Builder(
              builder: (context) {
                return IconButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.editProfileView,
                      arguments: context.read<ProfileCubit>(),
                    );
                  },
                  icon: Icon(Icons.settings),
                );
              },
            ),
          ],
        ),
        body: ProfileViewBody(),
      ),
    );
  }
}
