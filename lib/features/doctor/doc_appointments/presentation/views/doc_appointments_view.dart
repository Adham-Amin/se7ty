import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7ty/core/services/firebase_service.dart';
import 'package:se7ty/core/utils/app_styles.dart';
import 'package:se7ty/features/doctor/doc_appointments/data/data_sources/doc_appointments_data_source.dart';
import 'package:se7ty/features/doctor/doc_appointments/data/repos/doc_appointments_repo_impl.dart';
import 'package:se7ty/features/doctor/doc_appointments/presentation/cubit/doc_appointments_cubit.dart';
import 'package:se7ty/features/doctor/doc_appointments/presentation/widgets/doc_appointments_view_body.dart';

class DocAppointmentsView extends StatelessWidget {
  const DocAppointmentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DocAppointmentsCubit(
        docAppointmentsRepo: DocAppointmentsRepoImpl(
          docAppointmentsDataSource: DocAppointmentsDataSourceImpl(
            firebaseService: FirebaseService(),
          ),
        ),
      )..getDocAppointments(),
      child: Scaffold(
        appBar: AppBar(title: Text('حجوزاتي', style: AppStyles.textBold18)),
        body: const DocAppointmentsViewBody(),
      ),
    );
  }
}
