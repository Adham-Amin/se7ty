import 'package:flutter/material.dart';
import 'package:se7ty/core/utils/app_colors.dart';
import 'package:se7ty/core/utils/app_styles.dart';
import 'package:se7ty/core/widgets/height_and_width.dart';
import 'package:se7ty/features/auth/data/model/doctor_model.dart';
import 'package:se7ty/features/patient/doctor_details/presentation/widgets/phone_button.dart';
import 'package:url_launcher/url_launcher.dart';

class DoctorHeaderSection extends StatelessWidget {
  const DoctorHeaderSection({super.key, required this.doctorModel});

  final DoctorModel doctorModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 60,
          backgroundColor: AppColors.white,
          child: CircleAvatar(
            radius: 60,
            backgroundColor: AppColors.white,
            backgroundImage: (doctorModel.image != null)
                ? NetworkImage(doctorModel.image!)
                : const AssetImage('assets/doc.png') as ImageProvider,
          ),
        ),
        WidthBox(24),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "د. ${doctorModel.name ?? ''}",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.textBold18,
              ),
              HeightBox(12),
              Text(
                doctorModel.specialization ?? '',
                style: AppStyles.textRegular16,
              ),
              HeightBox(12),
              Row(
                children: [
                  Text(
                    doctorModel.rating.toString(),
                    style: AppStyles.textRegular16,
                  ),
                  WidthBox(4),
                  const Icon(
                    Icons.star_rounded,
                    size: 20,
                    color: Colors.orange,
                  ),
                ],
              ),
              HeightBox(16),
              Row(
                children: [
                  PhoneButton(
                    onTap: () {
                      launchUrl(Uri.parse('tel:${doctorModel.phone1}'));
                    },
                    backColor: AppColors.accent,
                    icon: Icons.phone,
                    num: '1',
                  ),
                  WidthBox(12),
                  if (doctorModel.phone2?.isNotEmpty == true)
                    PhoneButton(
                      onTap: () {
                        launchUrl(Uri.parse('tel:${doctorModel.phone2}'));
                      },
                      backColor: AppColors.accent,
                      icon: Icons.phone,
                      num: '2',
                    ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
