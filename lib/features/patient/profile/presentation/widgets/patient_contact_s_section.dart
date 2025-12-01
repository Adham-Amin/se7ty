import 'package:flutter/material.dart';
import 'package:se7ty/core/utils/app_colors.dart';
import 'package:se7ty/core/widgets/height_and_width.dart';
import 'package:se7ty/features/auth/data/model/patient_model.dart';
import 'package:se7ty/features/patient/doctor_details/presentation/widgets/tile_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class PatientContactSSection extends StatelessWidget {
  const PatientContactSSection({super.key, required this.patient});

  final PatientModel patient;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.accent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          TileWidget(
            onTap: () {
              launchUrl(Uri.parse('mailto:${patient.email}'));
            },
            text: patient.email ?? 'لم تضاف',
            icon: Icons.email,
          ),
          HeightBox(16),
          TileWidget(
            onTap: () => launchUrl(Uri.parse('tel:${patient.phone}')),
            text: patient.phone ?? 'لم تضاف',
            icon: Icons.call,
          ),
        ],
      ),
    );
  }
}
