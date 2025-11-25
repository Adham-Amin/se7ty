import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7ty/core/services/firebase_service.dart';
import 'package:se7ty/core/utils/app_styles.dart';
import 'package:se7ty/features/patient/home/data/data_sources/home_remote_data_source.dart';
import 'package:se7ty/features/patient/home/data/repo/home_repo.dart';
import 'package:se7ty/features/patient/home/presentation/cubit/home_cubit.dart';
import 'package:se7ty/features/patient/home/presentation/widgets/speciality_view_body.dart';

class SpecialityView extends StatelessWidget {
  const SpecialityView({super.key, required this.specialityName});

  final String specialityName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(
        homeRepo: HomeRepoImpl(
          homeRemoteDataSource: HomeRemoteDataSourceImpl(
            firebaseService: FirebaseService(),
          ),
        ),
      )..getDoctorsBySpecialty(specialty: specialityName),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(specialityName, style: AppStyles.textBold18),
        ),
        body: SpecialityViewBody(specialityName: specialityName),
      ),
    );
  }
}
