import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:se7ty/core/utils/app_colors.dart';
import 'package:se7ty/core/utils/app_styles.dart';
import 'package:se7ty/features/doctor/doc_appointments/presentation/widgets/doctor_appointment_expanded_content.dart';
import 'package:se7ty/features/doctor/doc_appointments/presentation/widgets/doctor_appointment_subtitle.dart';
import 'package:se7ty/features/patient/appointments/data/model/appointments_model.dart';

class DoctorAppointmentCard extends StatelessWidget {
  const DoctorAppointmentCard({super.key, required this.model});

  final AppointmentModel model;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      iconColor: AppColors.primary,
      collapsedIconColor: AppColors.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
      childrenPadding: EdgeInsets.symmetric(vertical: 12.h),
      expandedCrossAxisAlignment: CrossAxisAlignment.end,
      collapsedBackgroundColor: AppColors.accent,
      backgroundColor: AppColors.accent,
      title: Text(
        'المريض: ${model.name}',
        style: AppStyles.textBold16.copyWith(color: AppColors.primary),
      ),
      subtitle: DoctorAppointmentSubtitle(model: model),
      children: [DoctorAppointmentExpandedContent(model: model)],
    );
  }
}
