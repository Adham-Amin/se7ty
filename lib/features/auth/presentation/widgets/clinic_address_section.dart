import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:se7ty/core/utils/app_styles.dart';
import 'package:se7ty/core/widgets/custom_text_form_field.dart';

class ClinicAddressSection extends StatelessWidget {
  final TextEditingController controller;

  const ClinicAddressSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('عنوان العيادة', style: AppStyles.textRegular16),
        SizedBox(height: 8.h),
        CustomTextFormField(
          controller: controller,
          hintText: '5 شارع مصدق - الدقي - الجيزة',
          validator: (value) =>
              value!.isEmpty ? 'من فضلك ادخل عنوان العيادة' : null,
        ),
      ],
    );
  }
}
