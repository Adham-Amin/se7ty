import 'package:flutter/material.dart';
import 'package:se7ty/core/widgets/height_and_width.dart';
import 'package:se7ty/features/patient/appointments/data/model/appointments_model.dart';
import 'package:se7ty/features/patient/appointments/presentation/widgets/appointment_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoadingAppointments extends StatelessWidget {
  const LoadingAppointments({super.key, this.space});

  final bool? space;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: ListView.separated(
        padding: space == true
            ? const EdgeInsets.only(top: 24)
            : const EdgeInsets.all(0),
        itemCount: 3,
        physics: BouncingScrollPhysics(),
        separatorBuilder: (context, index) => HeightBox(12),
        itemBuilder: (context, index) => AppointmentCard(
          model: AppointmentModel(
            date: DateTime(2025, 11, 28),
            description: 'دكتور حب',
            doctorID: '892928',
            doctorName: 'ادهم امين',
            isComplete: false,
            location: 'مغاغة المنيا',
            name: 'يوسف علي',
            patientID: 'xlTl80uEojfRJMOIubDMrqlx5U22',
            phone: '01013970933',
            rating: 4,
          ),
        ),
      ),
    );
  }
}
