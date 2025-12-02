import 'package:flutter/material.dart';
import 'package:se7ty/core/utils/app_colors.dart';
import 'package:se7ty/core/widgets/height_and_width.dart';
import 'package:se7ty/features/patient/doctor_details/presentation/widgets/tile_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class PatientContactSSection extends StatelessWidget {
  const PatientContactSSection({
    super.key,
    this.email,
    this.phone,
    this.phone2,
  });

  final String? email;
  final String? phone;
  final String? phone2;

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
              launchUrl(Uri.parse('mailto:$email'));
            },
            text: email ?? 'لم تضاف',
            icon: Icons.email,
          ),
          HeightBox(16),
          TileWidget(
            onTap: () => launchUrl(Uri.parse('tel:$phone')),
            text: phone ?? 'لم تضاف',
            icon: Icons.call,
          ),
          if (phone2 != null) ...[
            HeightBox(16),
            TileWidget(
              onTap: () => launchUrl(Uri.parse('tel:$phone2')),
              text: phone2 ?? 'لم تضاف',
              icon: Icons.call,
            ),
          ],
        ],
      ),
    );
  }
}
