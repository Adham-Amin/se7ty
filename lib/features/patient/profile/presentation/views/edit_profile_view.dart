import 'package:flutter/material.dart';
import 'package:se7ty/core/utils/app_styles.dart';
import 'package:se7ty/features/patient/profile/presentation/widgets/edit_profile_view_body.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تعديل الملف الشخصي', style: AppStyles.textBold18),
      ),
      body: EditProfileViewBody(),
    );
  }
}
