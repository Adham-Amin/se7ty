import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7ty/core/services/firebase_service.dart';
import 'package:se7ty/core/utils/app_styles.dart';
import 'package:se7ty/features/patient/search/data/data_sources/search_remote_data_source.dart';
import 'package:se7ty/features/patient/search/data/repo/search_repo.dart';
import 'package:se7ty/features/patient/search/presentation/cubit/search_cubit.dart';
import 'package:se7ty/features/patient/search/presentation/widgets/search_view_body.dart';

class PatientSearchView extends StatelessWidget {
  const PatientSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(
        searchRepo: SearchRepoImpl(
          searchRemoteDataSource: SearchRemoteDataSourceImpl(
            firebaseService: FirebaseService(),
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('ابحث عن دكتور', style: AppStyles.textBold18),
        ),
        body: PatientSearchViewBody(),
      ),
    );
  }
}
