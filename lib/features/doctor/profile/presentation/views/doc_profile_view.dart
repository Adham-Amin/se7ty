import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7ty/core/cubit/theme_cubit.dart';
import 'package:se7ty/core/routes/app_routes.dart';
import 'package:se7ty/core/services/firebase_service.dart';
import 'package:se7ty/core/utils/app_styles.dart';
import 'package:se7ty/features/doctor/profile/data/data_source/doc_profile_remote_data_source.dart';
import 'package:se7ty/features/doctor/profile/data/repo/doc_profile_repo_impl.dart';
import 'package:se7ty/features/doctor/profile/presentation/manager/doc_profile_cubit/doc_profile_cubit.dart';
import 'package:se7ty/features/doctor/profile/presentation/widgets/doc_profile_view_body.dart';

class DocProfileView extends StatelessWidget {
  const DocProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DocProfileCubit(
        docProfileRepo: DocProfileRepoImpl(
          docProfileRemoteDataSource: DocProfileRemoteDataSourceImpl(
            firebaseService: FirebaseService(),
          ),
        ),
      )..getProfile(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              context.watch<ThemeCubit>().state == ThemeMode.light
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
            onPressed: () {
              context.read<ThemeCubit>().toggleTheme();
            },
          ),
          title: Text('حسابي', style: AppStyles.textBold18),
          actions: [
            Builder(
              builder: (context) {
                return IconButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.editDocProfileView,
                      arguments: context.read<DocProfileCubit>(),
                    );
                  },
                  icon: Icon(Icons.settings),
                );
              },
            ),
          ],
        ),
        body: DocProfileViewBody(),
      ),
    );
  }
}
