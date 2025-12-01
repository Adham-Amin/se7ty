import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:se7ty/core/utils/app_colors.dart';
import 'package:se7ty/core/utils/app_styles.dart';
import 'package:se7ty/core/widgets/height_and_width.dart';
import 'package:se7ty/features/auth/data/model/patient_model.dart';
import 'package:se7ty/features/patient/profile/presentation/widgets/patient_contact_s_section.dart';
import 'package:se7ty/features/patient/profile/presentation/widgets/profile_image.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoadingProfile extends StatelessWidget {
  const LoadingProfile({super.key, required this.image, required this.patient});

  final File? image;
  final PatientModel patient;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeightBox(24),
          Row(
            children: [
              ProfileImage(
                file: image,
                onPick: (file) {},
                imageUrl: patient.image ?? 'https://i.pravatar.cc/300',
              ),
              WidthBox(16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    patient.name ?? 'لم تضاف',
                    style: AppStyles.textBold16.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  HeightBox(8),
                  Text(
                    patient.city ?? 'لم تضاف',
                    style: AppStyles.textRegular16,
                  ),
                ],
              ),
            ],
          ),
          HeightBox(24),
          Text("نبذه تعريفية", style: AppStyles.textBold16),
          HeightBox(12),
          Text(patient.bio ?? 'لم تضاف', style: AppStyles.textRegular16),
          Divider(height: 48.h),
          Text("معلومات الاتصال", style: AppStyles.textBold16),
          HeightBox(12),
          PatientContactSSection(patient: patient),
        ],
      ),
    );
  }
}
