import 'package:flutter/material.dart';
import 'package:se7ty/core/utils/app_styles.dart';
import 'package:se7ty/features/doctor/profile/presentation/widgets/edit_doc_profile_view_body.dart';

class EditDocProfileView extends StatelessWidget {
  const EditDocProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تعديل الملف الشخصي', style: AppStyles.textBold18),
      ),
      body: EditDocProfileViewBody(),
    );
  }
}
