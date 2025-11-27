import 'package:flutter/material.dart';
import 'package:se7ty/core/utils/app_styles.dart';
import 'package:se7ty/features/patient/appointments/presentation/widgets/appointments_view_body.dart';

class PatientAppointmentsView extends StatelessWidget {
  const PatientAppointmentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('حجوزاتي', style: AppStyles.textBold18)),
      body: PatientAppointmentsViewBody(),
    );
  }
}
