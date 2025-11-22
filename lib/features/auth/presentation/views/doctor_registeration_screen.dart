import 'package:flutter/material.dart';
import 'package:se7ty/core/utils/app_styles.dart';
import 'package:se7ty/features/auth/presentation/widgets/doctor_registration_body.dart';

class DoctorRegisterView extends StatelessWidget {
  const DoctorRegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('إكمال عملية التسجيل', style: AppStyles.textBold18),
        centerTitle: true,
      ),
      body: const DoctorRegisterViewBody(),
    );
  }
}
