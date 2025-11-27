import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7ty/core/services/firebase_service.dart';
import 'package:se7ty/core/utils/app_styles.dart';
import 'package:se7ty/features/patient/appointments/data/data_sources/appointments_remote_data_source.dart';
import 'package:se7ty/features/patient/appointments/data/repo/appointments_repo.dart';
import 'package:se7ty/features/patient/appointments/presentation/cubit/appointments_cubit.dart';
import 'package:se7ty/features/patient/appointments/presentation/widgets/appointments_view_body.dart';

class PatientAppointmentsView extends StatelessWidget {
  const PatientAppointmentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppointmentsCubit(
        appointmentsRepo: AppointmentsRepoImpl(
          appointmentsRemoteDataSource: AppointmentsRemoteDataSourceImpl(
            firebaseService: FirebaseService(),
          ),
        ),
      )..getAppointments(),
      child: Scaffold(
        appBar: AppBar(title: Text('حجوزاتي', style: AppStyles.textBold18)),
        body: PatientAppointmentsViewBody(),
      ),
    );
  }
}
