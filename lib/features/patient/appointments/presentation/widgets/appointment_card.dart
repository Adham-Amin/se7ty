import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:se7ty/core/utils/app_colors.dart';
import 'package:se7ty/core/utils/app_styles.dart';
import 'package:se7ty/features/patient/appointments/presentation/data/model/appointments_model.dart';
import 'package:se7ty/features/patient/appointments/presentation/widgets/appointment_expanded_content.dart';
import 'package:se7ty/features/patient/appointments/presentation/widgets/appointment_subtitle.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({super.key, required this.model});

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
        'د. ${model.doctorName}',
        style: AppStyles.textBold16.copyWith(color: AppColors.primary),
      ),
      subtitle: AppointmentSubtitle(model: model),
      children: [AppointmentExpandedContent(model: model)],
    );
  }
}
