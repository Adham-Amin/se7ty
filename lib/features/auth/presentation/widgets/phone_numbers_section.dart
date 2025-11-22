import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:se7ty/core/utils/app_styles.dart';
import 'package:se7ty/core/widgets/custom_text_form_field.dart';

class PhoneNumbersSection extends StatelessWidget {
  final TextEditingController phone1;
  final TextEditingController phone2;

  const PhoneNumbersSection({
    super.key,
    required this.phone1,
    required this.phone2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('رقم الهاتف 1', style: AppStyles.textRegular16),
        SizedBox(height: 8.h),
        CustomTextFormField(
          controller: phone1,
          keyboardType: TextInputType.number,
          hintText: '+20xxxxxxxxxx',
          validator: (value) => value!.isEmpty ? 'من فضلك ادخل الرقم' : null,
        ),
        SizedBox(height: 16.h),
        Text('رقم الهاتف 2 (اختياري)', style: AppStyles.textRegular16),
        SizedBox(height: 8.h),
        CustomTextFormField(
          controller: phone2,
          keyboardType: TextInputType.number,
          hintText: '+20xxxxxxxxxx',
        ),
      ],
    );
  }
}
