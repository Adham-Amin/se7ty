import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:se7ty/features/patient/appointments/presentation/cubit/appointments_cubit.dart';
import 'package:se7ty/features/patient/appointments/presentation/widgets/appointments_list.dart';
import 'package:se7ty/features/patient/appointments/presentation/widgets/empty_appointments.dart';
import 'package:se7ty/features/patient/appointments/presentation/widgets/loading_appointments.dart';

class PatientAppointmentsViewBody extends StatelessWidget {
  const PatientAppointmentsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 24.h),
      child: BlocBuilder<AppointmentsCubit, AppointmentsState>(
        builder: (context, state) {
          if (state is AppointmentsLoaded) {
            if (state.appointments.isEmpty) {
              return EmptyAppointments();
            }
            return AppointmentsList(appointments: state.appointments);
          } else {
            return LoadingAppointments();
          }
        },
      ),
    );
  }
}
