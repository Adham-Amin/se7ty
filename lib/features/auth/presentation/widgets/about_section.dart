import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:se7ty/core/utils/app_styles.dart';
import 'package:se7ty/core/widgets/custom_text_form_field.dart';

class AboutSection extends StatelessWidget {
  final TextEditingController controller;

  const AboutSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('نبذة تعريفية', style: AppStyles.textRegular16),
        SizedBox(height: 8.h),
        CustomTextFormField(
          controller: controller,
          maxLines: 5,
          hintText: 'سجل المعلومات الطبية العامة مثل تعليمك الأكاديمي...',
          validator: (value) =>
              value!.isEmpty ? 'من فضلك ادخل النبذة التعريفية' : null,
        ),
      ],
    );
  }
}
