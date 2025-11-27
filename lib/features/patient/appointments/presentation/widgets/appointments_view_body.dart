import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:se7ty/features/patient/appointments/presentation/data/model/appointments_model.dart';
import 'package:se7ty/features/patient/appointments/presentation/widgets/appointment_card.dart';
import 'package:se7ty/features/patient/appointments/presentation/widgets/appointments_list.dart';

class PatientAppointmentsViewBody extends StatelessWidget {
  const PatientAppointmentsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 24.h),
      child: AppointmentsList(
        appointments: [
          AppointmentCard(
            model: AppointmentModel(
              date: DateTime(2025, 11, 27),
              description: 'دكتور حب',
              doctorID: '892928',
              doctorName: 'ادهم امين',
              isComplete: false,
              location: 'مغاغة المنيا',
              name: 'يوسف علي',
              patientID: '57',
              phone: '01013970933',
              rating: 4,
            ),
          ),
        ],
      ),
    );
  }
}
