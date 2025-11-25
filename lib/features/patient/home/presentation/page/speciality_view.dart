import 'package:flutter/material.dart';
import 'package:se7ty/core/utils/app_styles.dart';
import 'package:se7ty/features/patient/home/presentation/widgets/speciality_view_body.dart';

class SpecialityView extends StatelessWidget {
  const SpecialityView({super.key, required this.specialityName});

  final String specialityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(specialityName, style: AppStyles.textBold18),
      ),
      body: SpecialityViewBody(specialityName: specialityName),
    );
  }
}
