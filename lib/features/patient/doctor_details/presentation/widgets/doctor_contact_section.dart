import 'package:flutter/material.dart';
import 'package:se7ty/core/utils/app_colors.dart';
import 'package:se7ty/core/utils/app_styles.dart';
import 'package:se7ty/core/widgets/height_and_width.dart';
import 'package:se7ty/features/auth/data/model/doctor_model.dart';
import 'package:se7ty/features/patient/doctor_details/presentation/widgets/tile_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class DoctorContactSection extends StatelessWidget {
  const DoctorContactSection({super.key, required this.doctorModel});

  final DoctorModel doctorModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("معلومات الاتصال", style: AppStyles.textBold16),
        HeightBox(12),
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: AppColors.accent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              TileWidget(
                onTap: () {
                  launchUrl(Uri.parse('mailto:${doctorModel.email}'));
                },
                text: doctorModel.email ?? '',
                icon: Icons.email,
              ),
              HeightBox(16),
              TileWidget(
                onTap: () =>
                    launchUrl(Uri.parse('https://wa.me/${doctorModel.phone1}')),
                text: doctorModel.phone1 ?? '',
                icon: Icons.call,
              ),
              if (doctorModel.phone2?.isNotEmpty == true) ...[
                HeightBox(16),
                TileWidget(
                  onTap: () =>
                      launchUrl(Uri.parse('tel:${doctorModel.phone2}')),
                  text: doctorModel.phone2 ?? '',
                  icon: Icons.call,
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
