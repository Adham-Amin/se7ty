import 'package:flutter/material.dart';
import 'package:se7ty/core/widgets/height_and_width.dart';
import 'package:se7ty/features/patient/appointments/data/model/appointments_model.dart';
import 'package:se7ty/features/patient/appointments/presentation/widgets/appointment_card.dart';

class AppointmentsList extends StatelessWidget {
  const AppointmentsList({super.key, required this.appointments});

  final List<AppointmentModel> appointments;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: appointments.length,
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, index) => HeightBox(12),
      itemBuilder: (context, index) =>
          AppointmentCard(model: appointments[index]),
    );
  }
}
