import 'package:flutter/material.dart';
import 'package:se7ty/core/utils/app_colors.dart';
import 'package:se7ty/core/utils/app_styles.dart';
import 'package:se7ty/features/patient/home/presentation/widgets/patient_home_view_body.dart';

class PatientHomeView extends StatelessWidget {
  const PatientHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            splashRadius: 20,
            icon: const Icon(Icons.notifications_active, color: AppColors.dark),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'صــــــحّـتــي',
          style: AppStyles.textBold18.copyWith(color: AppColors.dark),
        ),
      ),
      body: PatientHomeViewBody(),
    );
  }
}
