import 'package:flutter/material.dart';
import 'package:se7ty/core/widgets/height_and_width.dart';
import 'package:se7ty/features/auth/data/model/doctor_model.dart';
import 'package:se7ty/features/patient/doctor_details/presentation/widgets/doctor_bio_section.dart';
import 'package:se7ty/features/patient/doctor_details/presentation/widgets/doctor_contact_section.dart';
import 'package:se7ty/features/patient/doctor_details/presentation/widgets/doctor_header_section.dart';
import 'package:se7ty/features/patient/doctor_details/presentation/widgets/doctor_info_tile_section.dart';

class DoctorDetailsBody extends StatelessWidget {
  const DoctorDetailsBody({super.key, required this.doctorModel});

  final DoctorModel doctorModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DoctorHeaderSection(doctorModel: doctorModel),
            HeightBox(24),
            BioSection(bio: doctorModel.bio ?? ''),
            HeightBox(24),
            DoctorInfoTileSection(
              address: doctorModel.address ?? '',
              open: doctorModel.openHour?.split(':')[0] ?? '',
              close: doctorModel.closeHour?.split(':')[0] ?? '',
            ),
            Divider(height: 48),
            DoctorContactSection(doctorModel: doctorModel),
          ],
        ),
      ),
    );
  }
}
