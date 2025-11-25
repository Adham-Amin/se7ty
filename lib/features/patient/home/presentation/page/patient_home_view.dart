import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7ty/core/services/firebase_service.dart';
import 'package:se7ty/core/utils/app_colors.dart';
import 'package:se7ty/core/utils/app_styles.dart';
import 'package:se7ty/features/patient/home/data/data_sources/home_remote_data_source.dart';
import 'package:se7ty/features/patient/home/data/repo/home_repo.dart';
import 'package:se7ty/features/patient/home/presentation/cubit/home_cubit.dart';
import 'package:se7ty/features/patient/home/presentation/widgets/patient_home_view_body.dart';

class PatientHomeView extends StatelessWidget {
  const PatientHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness == Brightness.dark;
    return BlocProvider(
      create: (context) => HomeCubit(
        homeRepo: HomeRepoImpl(
          homeRemoteDataSource: HomeRemoteDataSourceImpl(
            firebaseService: FirebaseService(),
          ),
        ),
      )..getTopRateDoctors(),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              splashRadius: 20,
              icon: Icon(
                Icons.notifications_active,
                color: isDark ? Colors.white : AppColors.dark,
              ),
              onPressed: () {},
            ),
          ],
          backgroundColor: isDark ? AppColors.dark : Colors.white,
          centerTitle: true,
          title: Text('صــــــحّـتــي', style: AppStyles.textBold18),
        ),
        body: PatientHomeViewBody(),
      ),
    );
  }
}
