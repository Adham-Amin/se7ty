import 'package:flutter/material.dart';
import 'package:se7ty/core/utils/app_colors.dart';
import 'package:se7ty/core/widgets/height_and_width.dart';
import 'package:se7ty/features/patient/doctor_details/presentation/widgets/tile_widget.dart';

class DoctorInfoTileSection extends StatelessWidget {
  const DoctorInfoTileSection({
    super.key,
    required this.open,
    required this.close,
    required this.address,
  });

  final String open;
  final String close;
  final String address;

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
            text: '$open:00 - $close:00',
            icon: Icons.watch_later_outlined,
          ),
          HeightBox(16),
          TileWidget(text: address, icon: Icons.location_on_rounded),
        ],
      ),
    );
  }
}
