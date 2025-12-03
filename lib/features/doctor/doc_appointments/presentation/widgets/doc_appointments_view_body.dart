import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:se7ty/core/widgets/height_and_width.dart';
import 'package:se7ty/features/doctor/doc_appointments/presentation/cubit/doc_appointments_cubit.dart';
import 'package:se7ty/features/doctor/doc_appointments/presentation/widgets/doctor_appointment_card.dart';
import 'package:se7ty/features/patient/appointments/presentation/widgets/empty_appointments.dart';
import 'package:se7ty/features/patient/appointments/presentation/widgets/loading_appointments.dart';

class DocAppointmentsViewBody extends StatelessWidget {
  const DocAppointmentsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: BlocBuilder<DocAppointmentsCubit, DocAppointmentsState>(
        builder: (context, state) {
          if (state is DocAppointmentsLoaded) {
            if (state.appointments.isEmpty) {
              return EmptyAppointments();
            }
            return ListView.separated(
              padding: const EdgeInsets.only(top: 24),
              itemCount: state.appointments.length,
              separatorBuilder: (context, index) => HeightBox(12),
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return DoctorAppointmentCard(model: state.appointments[index]);
              },
            );
          } else {
            return LoadingAppointments(space: true);
          }
        },
      ),
    );
  }
}
